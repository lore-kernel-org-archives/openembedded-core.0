Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3779E71AB5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 20:34:27 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id e64so531629pfk.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 13:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=YzUApP+7/U386zSUeaUiJyoxtUpvPRAqDGR2H+NX5GM=;
	b=eQQXzjJsz1lgObxPXVnk6fj5jQ28xr+xsQ6eTGGU2zrAmh2nZxUou69STWqjt4fpkN
	RQUme7ATQbwp4E0gG0sEtYMgfwYgNszcnI1RLWVSya6eaCtpy006W+cTtw1YIxekp4yI
	qKz/aRT29OggP+3G9Ls0KI+9rBvbufoM+TAc32QPBI4oqIKMJtU+506JPzzs0xqL7kzV
	E/sFqOa+Y71IsmTSxzLe39BUYe67yntzLOIou7UT9NrTIn9pwBPZKMT6lGLCZhlv6oY7
	MG2qFUfA+W0/eLK5f0QWFBUW2i3ugdE77OzZKXnOC7sAxLzVECj1YjRwNyRdxtGv8ZKT
	ohzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=YzUApP+7/U386zSUeaUiJyoxtUpvPRAqDGR2H+NX5GM=;
	b=NBpZWUtfO/CTw78kbtvAElTV3QIRcxRutOUldkidE/fmgcz/Y3PzrzV5QnSRug0+ND
	Eo7Aj0pcWLN76mUL6pN2fIUc0mtAOZJ8f/gw0MUMzhwdVT4aoY7FscRwTmqMwD1Wq8Lm
	cd/kEpoHv8Qn5p/Pic7O719KBQS0Y2x/epAYrTY934R0LQicE3NzBH5jU82vqLfn1Jk7
	pMHszs5cK52hR9W37PE/n5OiBwXoFYxEETiexQZ+sOTe8W/o6KJWKiY+a9dEjSpkkkiE
	gig2GOn/CU7kQutQDiwTlQ6IyT+0UaF/TqGzvsHZ0fmHwNc2qvVi3FPLR6wHewavs4PX
	0IFQ==
X-Gm-Message-State: AMCzsaXIOzcLgnhMpdZPKcX3dei2TAZ6n+N4AbCGXgRNKVb8qNAV4wbi
	8IvV+6cqaqanHeWEerQDQxjl63HS6HYqWIftv6Q=
X-Google-Smtp-Source: ABhQp+TJsfyfcTyFRECYaHRWdrK/tcLVFR6PUxNy4+l7WW926puhVi0X9JIpMTscKwjjZu7bxLW1KAGBVmCma6LllTQ=
X-Received: by 10.101.74.129 with SMTP id b1mr4876480pgu.341.1509654869092;
	Thu, 02 Nov 2017 13:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQYJAvQo_buybnL8OUmwYfhezzuxx-dTO8wzuM=aQvKGYW+5Q@mail.gmail.com>
In-Reply-To: <CAAQYJAvQo_buybnL8OUmwYfhezzuxx-dTO8wzuM=aQvKGYW+5Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 02 Nov 2017 20:34:18 +0000
Message-ID: <CAMKF1sqOZXCdo+oS8hYPava8er8Y7bX4iLTxeWPXMkC_yLU=Jw@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Backport gcc7 fixes for armv5e [ARM] PR 82445
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
X-List-Received-Date: Thu, 02 Nov 2017 20:34:28 -0000
Content-Type: multipart/alternative; boundary="089e0825288434add4055d05ea30"

--089e0825288434add4055d05ea30
Content-Type: text/plain; charset="UTF-8"

Please open a bugzilla entry too

On Thu, Nov 2, 2017 at 1:46 AM Andrea Adami <andrea.adami@gmail.com> wrote:

> Hello,
>
> the gcc7 shipped with rocko produces unbootable kernels on armv5e [1].
> Bug was fixed recently, apparently in revision 253892 [2]
>
> Khem, please take care of this, thanks.
>
> Cheers
> Andrea
>
> [1] https://www.spinics.net/lists/arm-kernel/msg594654.html
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82445
>

--089e0825288434add4055d05ea30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please open a bugzilla entry too</div><br><div class=
=3D"gmail_quote"><div>On Thu, Nov 2, 2017 at 1:46 AM Andrea Adami &lt;<a hr=
ef=3D"mailto:andrea.adami@gmail.com">andrea.adami@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
the gcc7 shipped with rocko produces unbootable kernels on armv5e [1].<br>
Bug was fixed recently, apparently in revision 253892 [2]<br>
<br>
Khem, please take care of this, thanks.<br>
<br>
Cheers<br>
Andrea<br>
<br>
[1] <a href=3D"https://www.spinics.net/lists/arm-kernel/msg594654.html" rel=
=3D"noreferrer" target=3D"_blank">https://www.spinics.net/lists/arm-kernel/=
msg594654.html</a><br>
[2] <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D82445" rel=3D=
"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=
=3D82445</a><br>
</blockquote></div></div>

--089e0825288434add4055d05ea30--
