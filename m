Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id BE25879615
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 21:07:40 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id k12-v6so17617816oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 14:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=z+xnvbEuYFm6alpJm4O4aiwFtFIUdrOQlI417wjafno=;
	b=ZhVAeXjbGWaMwPES1hHCKlmn0r3/TrlCv4X25OTAfce6IqtzbZF9emG4XubNdsiQAK
	lj+LrkhfigbuMiBpmjBTzNwfoVgD/MiUrD4lcPioXwHR/H14mIpWaABzHiC7MEIa2RsS
	h3hqWkBEDUtPHALwcFkGehXRbgpoO1rs9Q9MqcpbAGI6YUgeyQCwxh+neq1UyMeT/2OW
	iklllPChLmLHgBxz1R+g0PiQyB6kFpRzFlpAXeBUQrU6aPbkOLPRx4lYXdk/l25Onujz
	jQtKd1Fj4Obqkdf/PPXQ9GdcukneV7gQxc9gIzRBAmiIs0uak5c58jO4NjhJDkqG4u9j
	3GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=z+xnvbEuYFm6alpJm4O4aiwFtFIUdrOQlI417wjafno=;
	b=VRHq6rXb6iBU80j91ZaSeZ7UzeSBSTzDeOakpAIbQiyRYTZgZW/poT6cCHQBAfPWVp
	Kh3SV13nxFn73Q+KjPz+Mgglm0yPwPsj16iPuyOlfjg4c+BHP+VWtoSlV15Rc1U3b6qT
	3BdV32sDsJ/jZoGAJY4WsMgwRBQRNvdPiWGiZcWHzW3uDJV+IVkb5TUo1PaLzPqTcYvS
	P/UqKMUSCNmalEg9AAJBHZGFXFSVlgw1BVSM8v6RJmufkLq1nLkaWOiCBAtvizhWgH5I
	BzfTSIWVlHt3Zx5tAocMRmJW+2oY2iZwgACoSIOJfYKRxMWw02Z89XeMrvFNBCioKhr9
	AGjg==
X-Gm-Message-State: APzg51BgOULhvOWlYvF01ZoHuCknjCLQqzIn+CSThPhOQJmVJWYLuLnb
	GRJqVz6uD8qrxm1fBIAl0iaW0thbvsBiHws9gB08cw==
X-Google-Smtp-Source: ANB0VdZ5zAvDl3jTdvRVJZbyjju/llV4mwxabah35fW/9snjphLqsrxz29HtwEIV8H4hktQeJBXDjsPQaDMiCo2JOCQ=
X-Received: by 2002:a54:4d9d:: with SMTP id
	y29-v6mr3123775oix.273.1535144861549; 
	Fri, 24 Aug 2018 14:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
In-Reply-To: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 25 Aug 2018 09:07:28 +1200
Message-ID: <CADySD0EOT72RZwVHn_FEr94mAUEp2x8pP-D2+1mZfCoUv+CW3g@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][sumo][master][PATCH 1/2] bitbake.conf: add PERSISTENT_LOG_DIR variable
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
X-List-Received-Date: Fri, 24 Aug 2018 21:07:41 -0000
Content-Type: multipart/alternative; boundary="00000000000026c7cd057434c447"

--00000000000026c7cd057434c447
Content-Type: text/plain; charset="UTF-8"

Ping

Regards
Ankur

On Sat 18 Aug, 2018, 12:59 PM Ankur Tyagi, <ankur.tyagi85@gmail.com> wrote:

> This variable is only respected when VOLATILE_LOG_DIR is "no".
>
> The default value is "" which results in the /var/log being log directory.
>
> The user could override this value to a path e.g "/home/root/log" which
> results /var/log being a link pointing to /home/root/log directory on
> persistent storage.
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e5dc1ac..9db22c8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -88,6 +88,8 @@ ROOT_HOME ??= "/home/root"
>  # If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links
> to /var/volatile/log.
>  # If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on
> persistent storage.
>  VOLATILE_LOG_DIR ?= "yes"
> +# If VOLATILE_LOG_DIR is false and PERSISTENT_LOG_DIR is set, /var/log
> links to PERSISTENT_LOG_DIR
> +PERSISTENT_LOG_DIR ??= ""
>
>  ##################################################################
>  # Architecture-dependent build variables.
> --
> 2.7.4
>
>

--00000000000026c7cd057434c447
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ping<div dir=3D"auto"><br></div><div dir=3D"auto">Regards=
</div><div dir=3D"auto">Ankur</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">On Sat 18 Aug, 2018, 12:59 PM Ankur Tyagi, &lt;<a href=3D"mai=
lto:ankur.tyagi85@gmail.com" target=3D"_blank" rel=3D"noreferrer">ankur.tya=
gi85@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This =
variable is only respected when VOLATILE_LOG_DIR is &quot;no&quot;.<br>
<br>
The default value is &quot;&quot; which results in the /var/log being log d=
irectory.<br>
<br>
The user could override this value to a path e.g &quot;/home/root/log&quot;=
 which<br>
results /var/log being a link pointing to /home/root/log directory on<br>
persistent storage.<br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">ankur.tyagi85@gmail.com</a>&=
gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index e5dc1ac..9db22c8 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -88,6 +88,8 @@ ROOT_HOME ??=3D &quot;/home/root&quot;<br>
=C2=A0# If set to boolean true (&#39;yes&#39;, &#39;y&#39;, &#39;true&#39;,=
 &#39;t&#39;, &#39;1&#39;), /var/log links to /var/volatile/log.<br>
=C2=A0# If set to boolean false (&#39;no&#39;, &#39;n&#39;, &#39;false&#39;=
, &#39;f&#39;, &#39;0&#39;), /var/log is on persistent storage.<br>
=C2=A0VOLATILE_LOG_DIR ?=3D &quot;yes&quot;<br>
+# If VOLATILE_LOG_DIR is false and PERSISTENT_LOG_DIR is set, /var/log lin=
ks to PERSISTENT_LOG_DIR<br>
+PERSISTENT_LOG_DIR ??=3D &quot;&quot;<br>
<br>
=C2=A0##################################################################<br=
>
=C2=A0# Architecture-dependent build variables.<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>

--00000000000026c7cd057434c447--
