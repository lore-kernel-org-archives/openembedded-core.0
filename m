Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5E30A606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 12:34:06 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id b62so45947387iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 05:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2pDB4O3vpsie8NUkuUmWefdQOYi3qq9wsUBLP9zRMH8=;
	b=eK9obM8lGm12Evb2rgMImsHKGXoYXYIT2YMZTsb1DIxjE376Zt63O4wDT/IvpCIKJO
	NrvZuLmsn+HxWq4IaPq0vAuPrRYi32PJOiLukbBAKIQU+MpKmRd0O10rTiWWrmLLtCEE
	zlAQrDDz6EOrWdJVyoW3Y+D7MYQlV/eOn1zEdAhwUta6e0TenKgAPLA0aEAGM4bXnPpY
	EAA58o+f0wV+FQoIgR1mFDgn/2BPQqwVHDd8yQ7VvUWh234JzSb3G8kZZvfK0MmUxByM
	OXlFwRq54HWbrBBxaGO7YlL0IiH88fmwKVDpeX3Wjbp9Qxe3Ev2e7rn0XQv+a/RYxsl2
	lJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2pDB4O3vpsie8NUkuUmWefdQOYi3qq9wsUBLP9zRMH8=;
	b=Car0CZgHkcFbgu70hYExITrKXhB85l0jvLn3cuIP83l3BRx17NAduT8Oi6IRoYi1g/
	0S84YzBzkIat/UDreV4/2oRmuae0aJ1TNCAefFlfFboGmLFcjvt4z06eNRCXr97ghlcD
	E8Kgvg7J4E7R15NMsw8+JCcU+f6U876a2EDQSy4N7mLYyz8PzUUc/ZIo7lrOrV79haZ7
	w3+2RDEOqaYbdLnvXSmycdBtZTLhad1U4NYB2lquPZak0jQ9iywIlGRRSNoKNQYYSS6W
	fwhOwaSce9h3KLV+07lPdXiit3on+VuuYSw/MshjZSVgYY/TvQAuMxLkXd+CbNWBJ+nj
	7P4Q==
X-Gm-Message-State: ALyK8tJuM8LHnivbmFgNaxd+yRoSAp5eE0AKk9HNa7mRpgY8/kugSoSHLXBh0Iyr/IZ6MjYpjcq9rDz4PDfX5N4V
X-Received: by 10.107.154.196 with SMTP id c187mr14915331ioe.99.1469018047521; 
	Wed, 20 Jul 2016 05:34:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 20 Jul 2016 05:33:48 -0700 (PDT)
In-Reply-To: <1468896078-226867-1-git-send-email-jianchuan.wang@windriver.com>
References: <1468896078-226867-1-git-send-email-jianchuan.wang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Jul 2016 13:33:48 +0100
Message-ID: <CAJTo0La8K1ujxo9K7pXm1roNarYH77ijc50ps13y_hP9uAgDeQ@mail.gmail.com>
To: jianchuan.wang@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] net-tools: lib/inet6.c:INET6_rresolve() - various fixes [ LIN9-1102 ]
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
X-List-Received-Date: Wed, 20 Jul 2016 12:34:08 -0000
Content-Type: multipart/alternative; boundary=001a1140e81ee4441f0538106a42

--001a1140e81ee4441f0538106a42
Content-Type: text/plain; charset=UTF-8

Please have a more useful short summary.

On 19 July 2016 at 03:41, <jianchuan.wang@windriver.com> wrote:

> From: Shan Hai <shan.hai@windriver.com>
>
> Integrate net-tools upstream commit a70c568b907d to fix a bug which
> causes the 'netstat -a' to print "[UNKNOWN]" in case of DNS problem
> instead of IPv6 address.

...

>  +Upstream-Status: Pending


Don't you mean Backport?

Ross

--001a1140e81ee4441f0538106a42
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please have a more useful short summary.<br><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 19 July 2016 at 03:41,  <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:jianchuan.wang@windriver.com" target=3D=
"_blank">jianchuan.wang@windriver.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">From: Shan Hai &lt;<a href=3D"mailto:shan.hai@windriver.=
com">shan.hai@windriver.com</a>&gt;<br>
<br>
Integrate net-tools upstream commit a70c568b907d to fix a bug which<br>
causes the &#39;netstat -a&#39; to print &quot;[UNKNOWN]&quot; in case of D=
NS problem<br>
instead of IPv6 address.</blockquote><div>...=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">=C2=A0+Upstream-Status: Pending</blockquote><div><br></div><d=
iv>Don&#39;t you mean Backport?</div><div><br></div><div>Ross</div></div></=
div></div>

--001a1140e81ee4441f0538106a42--
