Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BAB897089E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 02:37:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s6U2bvmh024831
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Jul 2014 19:37:57 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 29 Jul 2014 19:37:56 -0700
Message-ID: <53D85A83.7090405@windriver.com>
Date: Wed, 30 Jul 2014 10:37:55 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: =?windows-1252?Q?S=E9bastien_Mennetrier?= <smennetrier@connected-labs.com>,
	<openembedded-core@lists.openembedded.org>
References: <1404915889-26159-1-git-send-email-smennetrier@connected-labs.com>
	<CAKCtLPy=a4EHgA1Nqvih9JMNxeyVuLp7UUEifGsfPaF-G1Srxw@mail.gmail.com>
In-Reply-To: <CAKCtLPy=a4EHgA1Nqvih9JMNxeyVuLp7UUEifGsfPaF-G1Srxw@mail.gmail.com>
Subject: Re: [dora][backport from master] apmd.service: Fix typo (not mandatory EnvironmentFile prefix)
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
X-List-Received-Date: Wed, 30 Jul 2014 02:37:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit


Sorry for the late response, it worked well for me, I will confirm
with RP.

// Robert

On 07/18/2014 03:30 PM, Sébastien Mennetrier wrote:
> Ping
>
> Is it possible to cherry-pick this patch from Master to Dora ?
>
> Commit : b21468434c519927dace6a1433786ca7a0501172
>
>
> Regards,
> Seb M
>
>
> 2014-07-09 16:24 GMT+02:00 Sébastien Mennetrier <smennetrier@connected-labs.com
> <mailto:smennetrier@connected-labs.com>>:
>
>     From: Tobias Blom <tobias.blom@techne-dev.se <mailto:tobias.blom@techne-dev.se>>
>
>     Prefix to EnvironmentFile should be preciding the filenamn.
>
>     (From OE-Core rev: 1f694e4cb493b0737b6009382c0957e6837ebbed)
>
>     Signed-off-by: Tobias Blom <tobias.blom@techne-dev.se
>     <mailto:tobias.blom@techne-dev.se>>
>     Signed-off-by: Saul Wold <sgw@linux.intel.com <mailto:sgw@linux.intel.com>>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
>     <mailto:richard.purdie@linuxfoundation.org>>
>     ---
>       meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
>     b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
>     index 62d6af1..ffab823 100644
>     --- a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
>     +++ b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
>     @@ -3,5 +3,5 @@ Description=Advanced Power Management daemon
>       After=remote-fs.target
>
>       [Service]
>     -EnvironmentFile-= @SYSCONFDIR@/default/apmd
>     +EnvironmentFile=-@SYSCONFDIR@/default/apmd
>       ExecStart=@SBINDIR@/apmd -P @SYSCONFDIR@/apm/apmd_proxy $APMD
>     --
>     1.8.3.2
>
>
>
>

