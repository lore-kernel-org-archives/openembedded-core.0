Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 208AD60667
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 23:19:26 +0000 (UTC)
Received: by igcto18 with SMTP id to18so43580916igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 15:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+g92oVv9KAq/uAp2zVcDp19/WBvZBHUqs9WCwRPT1Z0=;
	b=2KZf9VGVpqS37CH4cjInZ6/cj4XmnqBTn6Q/LVZS99t+drP9FUJJsdGZJn9jkozF0X
	QqnPwAUl5CUgJZXeF3+AhmBh2VJRERi7VmdJ7W3XlS5O92okJIaj1NZwawIWT4gHbS6U
	85nXUXByegixs69vTwOHUp+kBgZ7lHop4ShHGdIKT0t8o17NW6D16lJnOTRP7g7v9Shl
	ZW4EEDvSGjogVUNEWk5Mrkxu/AMRaDN36CkDrWux2FDKH3ru6j28rY22xxBimAbl8UfX
	WxnpykmLasgHrsx1BsiXP6io7Rd5CocmHuCq6oWh8nSwkfiV4hKVgbSTonsMnEEizFTW
	OIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+g92oVv9KAq/uAp2zVcDp19/WBvZBHUqs9WCwRPT1Z0=;
	b=Omid2zyO4yk66qB6Sz4aFS7+d1QYis+av/w/OLQvEgwmAnCXb01N6wWo5zUpxylQWM
	XXRkxKxjoZXX4dvMaElkwfuXFDwc74VU1Fporrsom8k5ApJNmp8Gg0OpPH8d/6QXKIFq
	oOsb0kVdkdigsubBiiBR+R176AIukk/IzXrubKyhLC3nj9tosmDhPLVvqtzJJaZZJqQm
	MqDuD6aHEcljZ8lKdoRd/12nVIoRpN1NVVmAK/AIbzKSV0Td7aN2xvfkKC190mHGKEWY
	ht/b7+DY25Gd+E6/nB3kSiC4smcmYR5zM9tPZlpHAr6+7gxYvEnkT1Vn/NKUOQ8kvcOT
	7krw==
X-Gm-Message-State: ALoCoQneDpnFFQ9kWdBq+luVtHLk8vtfEWWOhdte/768l0sk/C4rY/8keUVqaV6DlrhuLK/IShFb
X-Received: by 10.50.155.33 with SMTP id vt1mr5856844igb.64.1449098367636;
	Wed, 02 Dec 2015 15:19:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 2 Dec 2015 15:19:08 -0800 (PST)
In-Reply-To: <565F7BCE.2070203@ni.com>
References: <1449031718-3786-1-git-send-email-vz@mleia.com>
	<CAJTo0Lbzvbwc34aXEMgfUJGnANMzaB+4ecM1=sa=8KONeTJukw@mail.gmail.com>
	<565F7BCE.2070203@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 23:19:08 +0000
Message-ID: <CAJTo0La8P2oCEAfUeEX9w-+qab_wyRZhPM27FZ6QaORDBM92LQ@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH] package_ipk: allow to specify OPKG_ARGS in local.conf
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
X-List-Received-Date: Wed, 02 Dec 2015 23:19:28 -0000
Content-Type: multipart/alternative; boundary=001a11343daa72b36a0525f28118

--001a11343daa72b36a0525f28118
Content-Type: text/plain; charset=UTF-8

On 2 December 2015 at 23:16, Alejandro del Castillo <
alejandro.delcastillo@ni.com> wrote:

> > Whilst the patch is fine, this is worrying as noexec /tmp shouldn't
> break opkg.
> > Maybe opkg should be changed to use something in /var for the scripts?
>
> Could you expand on why it's better to use /var instead of /tmp as the
> default
> sandbox location for opkg? I believe dpkg uses /var/lib/ and would like to
> understand why that's better (to change opkg, if it makes sense)


Well in this case it's fairly common to mount /tmp as noexec on security
grounds, and to be limited in size (say a small tmpfs), whereas /var
generally has less restrictions.

Ross

--001a11343daa72b36a0525f28118
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 23:16, Alejandro del Castillo <span dir=3D"ltr">&lt;<=
a href=3D"mailto:alejandro.delcastillo@ni.com" target=3D"_blank">alejandro.=
delcastillo@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">&gt; Whilst the patch is fine, this is worrying as noexec =
/tmp shouldn&#39;t break opkg.<br>
&gt; Maybe opkg should be changed to use something in /var for the scripts?=
<br>
<br>
</span>Could you expand on why it&#39;s better to use /var instead of /tmp =
as the default<br>
sandbox location for opkg? I believe dpkg uses /var/lib/ and would like to<=
br>
understand why that&#39;s better (to change opkg, if it makes sense)</block=
quote></div><br>Well in this case it&#39;s fairly common to mount /tmp as n=
oexec on security grounds, and to be limited in size (say a small tmpfs), w=
hereas /var generally has less restrictions.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11343daa72b36a0525f28118--
