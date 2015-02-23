Return-Path: <kergoth@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id E832771633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 16:26:00 +0000 (UTC)
Received: by yhoa41 with SMTP id a41so11112287yho.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 08:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=J/W1GRAGiVFv4Jw6ClTbL0/0Xn3SXz+hGZammBDIRmc=;
	b=Iy4FvbNPc+9OYTkyL9BMadGG4MHK10PHP+J85TUclEBX58PjKhkJYqQOSbFHClRNzN
	9ZDFAI22W0T2+MvShQjxjSR0W58zDnZKuZI9fK0LvRGs2X4ALL5iKSDVq1BlmOimE6gp
	9QpqAjGLXguRcjnBTvBP1jfiBzmcW0mYZY0w62oCM480FiqLmz6FKYhZ6OeLqVXXO7IM
	s1f7k3OWCrp+tNLedHEa7wG8AxM8kNzYQRUpHsiAQxge6O5CYNTaePjuHNo12cERrm71
	ZJ2GjVNhAIcIaVK6jK5s1Wrj+PwCQutlLwCybTwDVxe3RHvUPbzoGBfEfs3xsNDhR7nW
	umzQ==
X-Received: by 10.236.203.108 with SMTP id e72mr10660600yho.48.1424708761263; 
	Mon, 23 Feb 2015 08:26:01 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.170.120.4 with HTTP; Mon, 23 Feb 2015 08:25:41 -0800 (PST)
In-Reply-To: <1424702651-9454-1-git-send-email-ross.burton@intel.com>
References: <1424702651-9454-1-git-send-email-ross.burton@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 23 Feb 2015 09:25:41 -0700
X-Google-Sender-Auth: __CdGMXA9WnPSTM7Gi-On9h1nHA
Message-ID: <CABcZANnh5dpJNzbtYFbVLdMRLrGtGf1t5C2_3LYyEZEa=Jp7=Q@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: clean up and clarify hostname logic
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
X-List-Received-Date: Mon, 23 Feb 2015 16:26:02 -0000
Content-Type: multipart/alternative; boundary=089e0160b5069fa561050fc3db0e

--089e0160b5069fa561050fc3db0e
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 23, 2015 at 7:44 AM, Ross Burton <ross.burton@intel.com> wrote:

> +# The default hostname.  If set to the magic value "machinename" then the
> value
> +# of MACHINE is used.  If the hostname is unset then a /etc/hostname file
> isn't
> +# written, suitable for environments with dynamic hostnames.
>  #
> -# set standard hostname, might be a candidate for a DISTRO variable? :M:
> -#
> -hostname = "openembedded"
> +# This can be changed outside of this recipe by using
> +# hostname_pn-base-files = "my-host-name".
> +hostname = "machinename"
>

Question, why use a magic value at all? Why not just set hostname =
"${MACHINE}"?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0160b5069fa561050fc3db0e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Feb 23, 2015 at 7:44 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":j3" clas=
s=3D"a3s" style=3D"overflow:hidden">+# The default hostname.=C2=A0 If set t=
o the magic value &quot;machinename&quot; then the value<br>
+# of MACHINE is used.=C2=A0 If the hostname is unset then a /etc/hostname =
file isn&#39;t<br>
+# written, suitable for environments with dynamic hostnames.<br>
=C2=A0#<br>
-# set standard hostname, might be a candidate for a DISTRO variable? :M:<b=
r>
-#<br>
-hostname =3D &quot;openembedded&quot;<br>
+# This can be changed outside of this recipe by using<br>
+# hostname_pn-base-files =3D &quot;my-host-name&quot;.<br>
+hostname =3D &quot;machinename&quot;</div></blockquote></div><br>Question,=
 why use a magic value at all? Why not just set hostname =3D &quot;${MACHIN=
E}&quot;?<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>cl=
arson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>=
Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--089e0160b5069fa561050fc3db0e--
