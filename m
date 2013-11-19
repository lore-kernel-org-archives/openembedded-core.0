Return-Path: <lizhijian@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 8072F6D000
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 02:24:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,727,1378828800"; 
   d="scan'208";a="9069591"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 19 Nov 2013 10:21:30 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id rAJ2OsAs030571;
	Tue, 19 Nov 2013 10:24:55 +0800
Received: from G08FNSTD110722 ([10.167.226.56])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013111910230168-221983 ;
	Tue, 19 Nov 2013 10:23:01 +0800 
From: "Li Zhijian" <lizhijian@cn.fujitsu.com>
To: "'Saul Wold'" <sgw@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>,
	"'Burton, Ross'" <ross.burton@intel.com>
References: <52677C01.1020908@cn.fujitsu.com>
	<527402CF.7060401@linux.intel.com>
In-Reply-To: <527402CF.7060401@linux.intel.com>
Date: Tue, 19 Nov 2013 10:24:52 +0800
Message-ID: <008601cee4ce$8834a330$989de990$@cn.fujitsu.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQEJhu3VHSEIzjMfRP8X700C0cIYpQHUo12gm6fn+jA=
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/11/19 10:23:01,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/11/19 10:23:02,
	Serialize complete at 2013/11/19 10:23:02
Subject: Re: [PATCH] systemd.bbclass: do not call 'systemctl restart ${SYSTEMD_SERVICE}' at systemd_postinst
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2013 02:24:58 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="shift_jis"
Content-Language: zh-cn

Sau=81CRoss=81C

How about it

--=20
Best regards.
Li Zhijian=20

 |-----Original Message-----
 |From: Saul Wold [mailto:sgw@linux.intel.com]
 |Sent: Saturday, November 02, 2013 3:37 AM
 |To: Li Zhijian; openembedded-core@lists.openembedded.org; Burton, Ross
 |Subject: Re: [OE-core] [PATCH] systemd.bbclass: do not call 'systemctl
 |restart ${SYSTEMD_SERVICE}' at systemd_postinst
 |
 |On 10/23/2013 12:34 AM, Li Zhijian wrote:
 |> From: Li Zhijian <lizhijian@cn.fujitsu.com>
 |>
 |> If systemd_postinst is installed as a delayed package scriptlet
(installed
 |to /etc/rpm-postints/${PN})
 |> which would be executed at the first time of OS startup. And then =
this
 |script would block when it is
 |> trying to call systemctl to restart service.
 |>
 |> It seems that it is not a good timing to restart service at
run-postinsts.
 |> I test serval services which has supported =
systemd(uuidd/avahi-daemon),
 |all of them
 |> will block the startup.
 |>
 |
 |Ross,
 |
 |Can you have a look at this change.
 |
 |Thanks
 |	Sau!
 |
 |
 |> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
 |> ---
 |>   meta/classes/systemd.bbclass |    4 ----
 |>   1 files changed, 0 insertions(+), 4 deletions(-)
 |>
 |> diff --git a/meta/classes/systemd.bbclass
 |b/meta/classes/systemd.bbclass
 |> index 3700b2e..7aa5459 100644
 |> --- a/meta/classes/systemd.bbclass
 |> +++ b/meta/classes/systemd.bbclass
 |> @@ -31,10 +31,6 @@ fi
 |>    if type systemctl >/dev/null 2>/dev/null; then
 |>   	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
 |> -
 |> -	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
 |> -		systemctl restart ${SYSTEMD_SERVICE}
 |> -	fi
 |>   fi
 |>   }
 |>   -- 1.7.1
 |>
 |>
 |>
 |>
 |> _______________________________________________
 |> Openembedded-core mailing list
 |> Openembedded-core@lists.openembedded.org
 |> http://lists.openembedded.org/mailman/listinfo/openembedded-core
 |>




