Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 998C27858E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 17:23:52 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id w127so18109787iow.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 09:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=26Lv0u6jKhGTSHhMrwwbAqyT/6QfiZ2qcusyRqgU7Rw=;
	b=OmcybIQQodVmkyMwjYB3+/Zdd6UeJLP0kOFtbNsJxK0TXcqL52XuwjjTXKw/Agn/ju
	ZkAuYQR/UkPY3/K3BETuQ4NzdYwgo24eFYnfwwRATepQLNS4n2Zh1KdbdWuY9r8hXq+s
	ubq0+kUm378GTLAzyA/6ph/d+fxLLs0y7I0dZR/rzGioAoJhfkzaaXD6jBDuNyaUK8Iu
	5ltw2XneJ1idFwFohawpDyUyuAY4q4yX2/oxFQ0MM4ZVN9a9RWvI705PuQO0/ZYe8yGe
	gfw1LuQZabxHnSGtokvpD6EY1cYf7q7rQOIy5Kt+8s6bfC0AkXSfqX8qCxgr5IMgGvR9
	PuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=26Lv0u6jKhGTSHhMrwwbAqyT/6QfiZ2qcusyRqgU7Rw=;
	b=boYcczc2TrIrZkWOCNMTUnfzXaxgK/EdfL8dJoSwpO8SHDD5nrd6QjSF7opNBzAjWe
	+f+VxNYR9VeZMKB/pc9nbn/Dal7ZS4pQl+fGwFXyBYn4YMjk2nodDni6XXmia7qkJ6BP
	q6AeNfrfebltsBOr1Naeaa0qm0ZVA7MmEQLM6BSNuZ7EQvmORg4w4VVmmx8AAd/ylPfZ
	URNZVOWwEUt0xM5An2ZyDzuGQazB6GJfo3S38wvfAGXFgIoK5+y2YGZWftlwymQdzaNb
	qTtfi520MzT+1JSvnr+EsilDt5KGWBl1/a6e2LaT+ZnOZtFqAv2O9+Ty8Z0OsszsQlX+
	CLsQ==
X-Gm-Message-State: AKGB3mJ2Fo2GoSn8KVoui1xN7mt9XSg+APr1L9kUgGYjC0jJ+cmWqbt6
	iYrccXHgKcdhSTlprDEgjoUX34UotWIkEpq3VDsy9w==
X-Google-Smtp-Source: ACJfBotzdMxovn0C0ZDM5EFPuv65Dh622PBGydam2qG+kjA8bKeF4Kzq6Tck+IfyB23534ZtqnutnhvtzE+UAqGTlvg=
X-Received: by 10.107.83.19 with SMTP id h19mr9354019iob.208.1513790633658;
	Wed, 20 Dec 2017 09:23:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Wed, 20 Dec 2017 09:23:33 -0800 (PST)
In-Reply-To: <20171220154511.12364-3-alexander.kanavin@linux.intel.com>
References: <20171220154511.12364-1-alexander.kanavin@linux.intel.com>
	<20171220154511.12364-3-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Dec 2017 17:23:33 +0000
Message-ID: <CAJTo0Lbj3Qr888ai7c9jG84_gLyt9A5Uu-PzbtBMNqD2fq8cKg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] runtime/cases/ptest.py: fail when ptests fail on target
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
X-List-Received-Date: Wed, 20 Dec 2017 17:23:52 -0000
Content-Type: multipart/alternative; boundary="089e08265ff8fc007e0560c8d82f"

--089e08265ff8fc007e0560c8d82f
Content-Type: text/plain; charset="UTF-8"

So the context was that so many ptests were failing that the test couldn't
be done automatically and expected to succeed. Bugs were filed and the
problem chipped away at, but last I looked it wasn't in a state to be
enabled.

If a core-image-sato passes with ptests enabled then that's great, but I'll
be surprised if it does!

Ross

On 20 December 2017 at 15:45, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> That's the whole point isn't it? Previously this testcase succeeded
> even if some of the underlying on-target tests failed; the only way
> to find out if anything was wrong was to manually inspect the logs.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/lib/oeqa/runtime/cases/ptest.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/lib/oeqa/runtime/cases/ptest.py
> b/meta/lib/oeqa/runtime/cases/ptest.py
> index 6669e24f141..c5b8c9cb8fb 100644
> --- a/meta/lib/oeqa/runtime/cases/ptest.py
> +++ b/meta/lib/oeqa/runtime/cases/ptest.py
> @@ -83,3 +83,11 @@ class PtestRunnerTest(OERuntimeTestCase):
>              # Remove the old link to create a new one
>              os.remove(ptest_log_dir_link)
>          os.symlink(os.path.basename(ptest_log_dir), ptest_log_dir_link)
> +
> +        failed_tests = {}
> +        for section in parse_result.result_dict:
> +            failed_testcases = [ test for test, result in
> parse_result.result_dict[section] if result == 'fail' ]
> +            if failed_testcases:
> +                failed_tests[section] = failed_testcases
> +
> +        self.assertFalse(failed_tests, msg = "Failed ptests: %s"
> %(str(failed_tests)))
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e08265ff8fc007e0560c8d82f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So the context was that so many ptests were failing that t=
he test couldn&#39;t be done automatically and expected to succeed. Bugs we=
re filed and the problem chipped away at, but last I looked it wasn&#39;t i=
n a state to be enabled.<div><br></div><div>If a core-image-sato passes wit=
h ptests enabled then that&#39;s great, but I&#39;ll be surprised if it doe=
s!<div><br></div><div>Ross</div></div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On 20 December 2017 at 15:45, Alexander Kanavin =
<span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" =
target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">That&#39;s the whole point isn&#39;t it? P=
reviously this testcase succeeded<br>
even if some of the underlying on-target tests failed; the only way<br>
to find out if anything was wrong was to manually inspect the logs.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/runtime/cases/<wbr>ptest.py | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/runtime/cases/<wbr>ptest.py b/meta/lib/oeqa/runt=
ime/cases/<wbr>ptest.py<br>
index 6669e24f141..c5b8c9cb8fb 100644<br>
--- a/meta/lib/oeqa/runtime/cases/<wbr>ptest.py<br>
+++ b/meta/lib/oeqa/runtime/cases/<wbr>ptest.py<br>
@@ -83,3 +83,11 @@ class PtestRunnerTest(<wbr>OERuntimeTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove the old link to cr=
eate a new one<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove(ptest_log_dir_lin=
k)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(os.path.basename(<wbr>ptest_lo=
g_dir), ptest_log_dir_link)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 failed_tests =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for section in parse_result.result_dict:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 failed_testcases =3D [ test for =
test, result in parse_result.result_dict[<wbr>section] if result =3D=3D &#3=
9;fail&#39; ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if failed_testcases:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 failed_tests[secti=
on] =3D failed_testcases<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse(failed_tests, msg =3D &quot;F=
ailed ptests: %s&quot; %(str(failed_tests)))<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--089e08265ff8fc007e0560c8d82f--
