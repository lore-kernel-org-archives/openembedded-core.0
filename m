Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id A6D346013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 17:41:56 +0000 (UTC)
Received: by qgem9 with SMTP id m9so125556717qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2H7OrXx75IU9Asuh7pSrBd44L3YgRt9sSqAfj8oFtag=;
	b=g1xfTOzVuabPiu5KP6TH/3ULTos372aW/RynOsCSlZgwbgm5433+Je18N9igYcj4HX
	i6uJ0N7kh9KN99VAaKdu3+W+TkdF/7H+YwHoAH6IylOAIvDhaEgH+VNPIgLxKWNvDXJr
	TPeTfsXNYdZ+zAuDsP8H/dermJvqK3IEqQLHBsZhMFvGD1iK8qsmP5L5+w4KTFf4FBvr
	HOfoM/DprLqoG/mbG8FwmYYKM7JCmicXaWIAluaUfrBCTLI9eYzHVjA/gVhn6cBkpDYJ
	zxJbqyzBpIIF2Lhd8/avEnnkTolavB8fUqKVjacNKD13WL8HOiusYq/BlOajrDiKi4Re
	tHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2H7OrXx75IU9Asuh7pSrBd44L3YgRt9sSqAfj8oFtag=;
	b=g+XuNt9u3p48GKWFjXCDDztguOCfJnFmDNZXyS8WTMUFFTHUv8PoH0hynuXb5ODoeX
	jt1Qhvi7zEJ1h3g2vgq6jqTF83hJQCZ15jhi+Kx/3g2sZwnVKKnXYa//O9EaYVLqYisQ
	1o8b//OkXUbJPXwXAmUfdVgOpa1qD69HDrcJiRub8m0pC74E7/oCXJ19qJNtTU0hGEnE
	Rxskez+ibjpunp8vbLyLCXfaxYcjitUeaDDivRt1Lu3DzWRkkDYqwOK6fnsyv4SyxiYa
	2+lH4Sysd55HYWoqDMDx32av9s6UVoDnImpymf6Q/LEH0HQfjCI91GxXhhDJzOAnT6Ue
	m0uA==
X-Gm-Message-State: ALoCoQnFr8o3vhLgZiMV7szZ+bQ102FPc6YFreP2vlA2vMxFDWn/SpA868ornuwlTj+VA8ckBVgm
X-Received: by 10.140.109.74 with SMTP id k68mr45330375qgf.77.1445881316254;
	Mon, 26 Oct 2015 10:41:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Mon, 26 Oct 2015 10:41:36 -0700 (PDT)
In-Reply-To: <56209AD4.3090809@windriver.com>
References: <1436941198-24451-1-git-send-email-wenzong.fan@windriver.com>
	<56209AD4.3090809@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Oct 2015 17:41:36 +0000
Message-ID: <CAJTo0La3rP35SvawgBcFcFBxSQ1NMAZ5spXKt7K3ZBDaKQ75DA@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] rpcbind: handle rpcbind options
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
X-List-Received-Date: Mon, 26 Oct 2015 17:41:56 -0000
Content-Type: multipart/alternative; boundary=001a1139af243e43520523057a66

--001a1139af243e43520523057a66
Content-Type: text/plain; charset=UTF-8

On 16 October 2015 at 07:36, wenzong fan <wenzong.fan@windriver.com> wrote:

> Ping again ...
>

Can the commit log please explain what is actually happening, instead of
"handle options".  I shouldn't have to read rpcbind documentation to
understand that -w means "warm start" and as such is only meant for
restarting, not startup.

Ross

--001a1139af243e43520523057a66
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 October 2015 at 07:36, wenzong fan <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:wenzong.fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":185" =
class=3D"a3s" style=3D"overflow:hidden">Ping again ...<br></div></blockquot=
e></div><br>Can the commit log please explain what is actually happening, i=
nstead of &quot;handle options&quot;.=C2=A0 I shouldn&#39;t have to read rp=
cbind documentation to understand that -w means &quot;warm start&quot; and =
as such is only meant for restarting, not startup.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1139af243e43520523057a66--
