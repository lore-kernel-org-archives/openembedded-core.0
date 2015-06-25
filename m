Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id DA64871633
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:13:36 +0000 (UTC)
Received: by qkfe185 with SMTP id e185so37218794qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 05:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TjuAXZ/05fYzJ6Sl8/8L3G+SGAJINO56q6qj4wvmqhs=;
	b=jIi7EnxYqtZZmcXUAQoyCT03H2wGtKLwnhSOql6fw4/oHzkUPCVHowBgI8hNTiUwQk
	80V0svmAn+TCVxzRvh9hqBgtUq7wHcJItxnYfjhcsCpwFkUXAqYAGohJ+hn0mSNMmLTx
	X4fCgeIacM/Ln0Vl12EOHHx1BoR8AG3JnVXR6A84KNKHmacuIbBJLqJWxDy84FzlQdin
	zUqiFu/MX7wGH2rd0OQbZBuXgckBrY5SAKMrNh2AeyP5TexVK4J8g48Uo27MafTEvtn+
	52zo7bqFHT9PaiutvNYKve4p0kFC+uYGOnyfNvpty1LCcK7TLTGSBi73Abee67k1v7Ob
	xy/g==
X-Gm-Message-State: ALoCoQnNJYvA4RWUwq/l5Pk4GF31PrzfXWvDP/ArTNif3zyVXf+qq4RtX9J6QnaDlErd6go5DK4r
X-Received: by 10.55.23.218 with SMTP id 87mr59710841qkx.36.1435234417602;
	Thu, 25 Jun 2015 05:13:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 25 Jun 2015 05:13:17 -0700 (PDT)
In-Reply-To: <8389e233505ed188fb41513d0f745a4b84874b6d.1435224137.git.liezhi.yang@windriver.com>
References: <cover.1435224137.git.liezhi.yang@windriver.com>
	<8389e233505ed188fb41513d0f745a4b84874b6d.1435224137.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Jun 2015 13:13:17 +0100
Message-ID: <CAJTo0LbkB2+oGC1wwj3yNWVV6Bz74uuzXPD4co17gqmz-Kq6ag@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] runqemu: disable graphic when no DISPLAY
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
X-List-Received-Date: Thu, 25 Jun 2015 12:13:44 -0000
Content-Type: multipart/alternative; boundary=001a11469484a185870519568df5

--001a11469484a185870519568df5
Content-Type: text/plain; charset=UTF-8

On 25 June 2015 at 10:24, Robert Yang <liezhi.yang@windriver.com> wrote:

> +if [ -z "$DISPLAY" -o "$GRAPHIC" = "no" ]; then
>

Does this break people using QEMU without SDL that connect to it using VNC?

Ross

--001a11469484a185870519568df5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 June 2015 at 10:24, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":29q" cla=
ss=3D"a3s" style=3D"overflow:hidden">+if [ -z &quot;$DISPLAY&quot; -o &quot=
;$GRAPHIC&quot; =3D &quot;no&quot; ]; then<br></div></blockquote></div><br>=
Does this break people using QEMU without SDL that connect to it using VNC?=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a11469484a185870519568df5--
