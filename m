Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SqXtw-0003dj-8x
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 01:06:57 +0200
Received: by yhjj56 with SMTP id j56so1276961yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2012 15:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=0pVOvf81JfP3srFFj8PQrfc0I3oXlLxiM9L3iphQXSE=;
	b=GfrRpd9kmIfQKaXvsWxFnPKoWeIH1dygGrNzX5XJuJFb4MJ0f40JClU40kU27Fff4U
	w61LNeuPDVzAvdn0CMULF2Ccr32wu6plyt3xuM79XZd4hWIGouTkhV8YMHdY42plU71G
	Ihaidv+8DY8sBJmwOYn6F6h28Cgd5QHLxRkjRKdGV15NBritmM4CVzr/LDDbMihSYu/9
	pd5hcsek0KQx1v0p73To11tcY1pjtFQU6/W2SXD1FCyZI/ZE5kfTP69GQ8Qul92OohCU
	E3peMCHRzdKzh5LYhx+TTQZGltPZJ8pfO++76w4HMPT2dEa+nG57uu10xu91Fd+ioGRw
	RePA==
MIME-Version: 1.0
Received: by 10.50.11.129 with SMTP id q1mr3927911igb.8.1342392938152; Sun, 15
	Jul 2012 15:55:38 -0700 (PDT)
Received: by 10.64.98.162 with HTTP; Sun, 15 Jul 2012 15:55:37 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
Received: by 10.64.98.162 with HTTP; Sun, 15 Jul 2012 15:55:37 -0700 (PDT)
In-Reply-To: <1342391327.2338.123.camel@trz-ThinkPad-T420>
References: <CAK18fxFZ-FdNbtc7-qMWDV4AAxUFdKJRmQDNrKkqDPQ6BL0ipQ@mail.gmail.com>
	<1342391327.2338.123.camel@trz-ThinkPad-T420>
Date: Mon, 16 Jul 2012 01:55:37 +0300
Message-ID: <CAK18fxG++qfAzNxv+ahNvwkk8VHQbwNJnChJNS6Y3u_R+evL5w@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm48Lnxlh3AVr9aPWwflCNZYEh19fpctzIFv5IA4RzBGxH6DzhErqapVxe8ubqNvieTb/TR
Subject: Re: Perf fail on mips
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Jul 2012 23:06:57 -0000
Content-Type: multipart/alternative; boundary=e89a8f50320c3a411c04c4e63638

--e89a8f50320c3a411c04c4e63638
Content-Type: text/plain; charset=ISO-8859-1

On Jul 16, 2012 1:29 AM, "Tom Zanussi" <tom.zanussi@intel.com> wrote:
>
> On Sun, 2012-07-15 at 23:19 +0300, Andrei Gherzan wrote:
> > Any fast ideas on this?
>
> There was a recent fix added to the 3.0 kernel for this problem:
>
>     cef17a1 perf: add sgidefs.h to for mips builds
>

I was sure it was a new problem. Didn't know if it was fixed already and
had no time for digging. :) Thank you for your fast reply.

Ag

--e89a8f50320c3a411c04c4e63638
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>On Jul 16, 2012 1:29 AM, &quot;Tom Zanussi&quot; &lt;<a href=3D"mailto:t=
om.zanussi@intel.com">tom.zanussi@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, 2012-07-15 at 23:19 +0300, Andrei Gherzan wrote:<br>
&gt; &gt; Any fast ideas on this?<br>
&gt;<br>
&gt; There was a recent fix added to the 3.0 kernel for this problem:<br>
&gt;<br>
&gt; =A0 =A0 cef17a1 perf: add sgidefs.h to for mips builds<br>
&gt;</p>
<p>I was sure it was a new problem. Didn&#39;t know if it was fixed already=
 and had no time for digging. :) Thank you for your fast reply.</p>
<p>Ag</p>

--e89a8f50320c3a411c04c4e63638--
