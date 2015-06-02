Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF627579C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 10:38:26 +0000 (UTC)
Received: by qcxw10 with SMTP id w10so57842480qcx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 03:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jCNwp4f5fUuv3ya5RGUyeJFCcv+iMDuAiew5TBC7Gdg=;
	b=F+pgu4BU7vgMpEendcB/7g+4CizspU10f75/AeqWjXeb0yUL5rrbs0aGpK1dIxUAgm
	+ZuMSi0lzHmbjMpAH2URXj1tZGff3v85218b/YGs1ABRqQJwRCyDe9v+8uYRy0J3B5OF
	/OHZCfBlkEJHBQdx7TtyMeWk7KeRg97WXTh0bIk2DbWGtKgvu2dX0+K7Xo8vDzzfRjLl
	lu/SqJup67EiYrvXd94hwk+LspihP3+PEcvaW2rzrPrYkVqg1+DDRf5R9x8WTuvDUZGI
	WlXqHZ+gq+LI1fMQD/JHRXXeXQ94XfTcwfcRw0Xrz1v2btnKtPOo3nH+qC6HiKrkLlQC
	j2cw==
X-Gm-Message-State: ALoCoQk//LqfYwWRN0oQjmq/uofZ4wsLGUaOrdsNJJMkyJrRTx4R91+tm4NDUgLgefLxJel0CjPn
X-Received: by 10.140.235.19 with SMTP id g19mr28992502qhc.52.1433241507869;
	Tue, 02 Jun 2015 03:38:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 2 Jun 2015 03:38:07 -0700 (PDT)
In-Reply-To: <556BB753.10808@windriver.com>
References: <1431476040-29583-1-git-send-email-rongqing.li@windriver.com>
	<556BB753.10808@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jun 2015 11:38:07 +0100
Message-ID: <CAJTo0La2TaPM2TiAucZXJ4jmZbxY82m4OpcE94E+8SGXVunM0Q@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V3] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Tue, 02 Jun 2015 10:38:28 -0000
Content-Type: multipart/alternative; boundary=001a11376dacf456170517868a62

--001a11376dacf456170517868a62
Content-Type: text/plain; charset=UTF-8

On 1 June 2015 at 02:37, Rongqing Li <rongqing.li@windriver.com> wrote:

> +EXTRA_OEMAKE = 'AM_CFLAGS="-D_FILE_OFFSET_BITS=64"'
>>
>
This seems fragile as you're relying on future maintainers checking that
upstream don't change the value of AM_CFLAGS.  Would passing
-U_FORTIFY_SOURCE via CPPFLAGS solve the problem in a neater way?

Ross

--001a11376dacf456170517868a62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 June 2015 at 02:37, Rongqing Li <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:rongqing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">+EXTRA_OEMAKE =3D &#39;AM_CFLAGS=3D&quot;-D_FILE_OFFSET_BITS=3D64=
&quot;&#39;<br></blockquote></blockquote></div><br>This seems fragile as yo=
u&#39;re relying on future maintainers checking that upstream don&#39;t cha=
nge the value of AM_CFLAGS.=C2=A0 Would passing -U_FORTIFY_SOURCE via CPPFL=
AGS solve the problem in a neater way?</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a11376dacf456170517868a62--
