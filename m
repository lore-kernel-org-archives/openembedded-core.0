Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id EF221731A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 11:54:48 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id y8so75084169igp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 03:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Z5b9aBzdlm/2UoAFbel/9qKxFFseQ8mAxQxTWjCwxyI=;
	b=nTIonavT5e8OqncptPKEN9Bn/5/hVEhG/uWRYdVJ1hV8o6NEQdV2lCahelemDF47NS
	a70BvWzhqPTaRn3a93qE7Oxvm1AD3yEIlcuCQGgFNyoZv39i0QJfp2yYciKQMSWGidJq
	lOSWaUtrfjTnp+mnIR2W3RnB1b6FqXCRIGJjxG+bJ6hUa/8Rih8YlyNorfaugN9CADMC
	FLzVbQ9kjwV8Yd+MdoDDHCcmkbgA45BoYfIKCGCiNgJetTrEuX4NIecjivAraiNmzoOu
	YJcQB10psdBMA2I2Z1kfBv0Bi2kd+EomF/9lM0Xfgn2EoMQMZ0saQH48uP4FZslZtSqo
	Z5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Z5b9aBzdlm/2UoAFbel/9qKxFFseQ8mAxQxTWjCwxyI=;
	b=Ymz1kWKBcuqJOTn7b7fRQdG3aU6AlyV3sYTE1IRLglTTbZMIaETUsszhTgYAf1xKJe
	J9oRNlBLW3PkfFrQKEfQqF9Imk7YlkAP6dukgnYL8NF+4EIoaLUYYrd9klkU+3SX0REp
	oOaeWTGSYKYRPg6DHHTacEEM3zXx0zr6kKtrMPZTG9n21a2wrBCgxoi04b01y9agmq2+
	1EhVNb+X+FMo82SIlqKnuqQQqwTKPhFQaduDleJRicqecPHKZzxu2A/ovSDAlJyDQiIu
	Mjvpi3GqnYzrigTAjND4p2uv4JMfRzyrxMyOZ9gR85oftQgjCcSIQHe1z+B+hedAskVv
	xJtg==
X-Gm-Message-State: AG10YOQU/rJYQjsHAIFhx/cVei+wbzfxQAAOSmTEKE2bWWQK7nOWUF5Sb+QSFsIL2kAKsNWbF+llce1V41cZB7RY
X-Received: by 10.50.56.101 with SMTP id z5mr17517332igp.78.1455623688948;
	Tue, 16 Feb 2016 03:54:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 16 Feb 2016 03:54:29 -0800 (PST)
In-Reply-To: <63b585477825b24809430439c86fcc78555ad6a2.1455027565.git.adrian.ratiu@ni.com>
References: <cover.1455027565.git.adrian.ratiu@ni.com>
	<63b585477825b24809430439c86fcc78555ad6a2.1455027565.git.adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Feb 2016 11:54:29 +0000
Message-ID: <CAJTo0LYA7q50qSen31oaoMH87hm0YuYFE_=hVNDXzKWBs+61CA@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/3] gpg_sign: add support for gpg signature types
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
X-List-Received-Date: Tue, 16 Feb 2016 11:54:49 -0000
Content-Type: multipart/alternative; boundary=089e0158b404e86eee052be1cccc

--089e0158b404e86eee052be1cccc
Content-Type: text/plain; charset=UTF-8

Hi,


This is an awesome patch, but sadly it conflicts with Markus's refactor of
related code.  Can you rebase this on top of Markus's work?  If you can't
find it on the list, then it's also staging in my poky-contrib:ross/mut
branch.

Thanks,
Ross

On 9 February 2016 at 14:22, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> ASC = ascii armoured, BIN = binary
>
> Create new variables + parameters to the gpg signer module to specify
> which type of gpg signature to generate (ASC or BIN).
>
> The rpm backend has already implemented signatures which default to
> binary, so its behaviour is unchanged by this.
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/classes/sign_package_feed.bbclass | 10 +++++++++-
>  meta/classes/sign_rpm.bbclass          | 12 +++++++++++-
>  meta/lib/oe/gpg_sign.py                | 13 +++++++++----
>  meta/lib/oe/package_manager.py         |  3 ++-
>  meta/recipes-core/meta/signing-keys.bb |  6 ++++--
>  5 files changed, 35 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/sign_package_feed.bbclass
> b/meta/classes/sign_package_feed.bbclass
> index d5df8af..4e703f2 100644
> --- a/meta/classes/sign_package_feed.bbclass
> +++ b/meta/classes/sign_package_feed.bbclass
> @@ -10,6 +10,10 @@
>  #           Optional variable for specifying the backend to use for
> signing.
>  #           Currently the only available option is 'local', i.e. local
> signing
>  #           on the build host.
> +# PACKAGE_FEED_GPG_SIGNATURE_TYPE
> +#           Optional variable for specifying the type of gpg signature,
> can be:
> +#               1. Ascii armored (ASC), default if not set
> +#               2. Binary (BIN)
>  # GPG_BIN
>  #           Optional variable for specifying the gpg binary/wrapper to
> use for
>  #           signing.
> @@ -20,7 +24,7 @@ inherit sanity
>
>  PACKAGE_FEED_SIGN = '1'
>  PACKAGE_FEED_GPG_BACKEND ?= 'local'
> -
> +PACKAGE_FEED_GPG_SIGNATURE_TYPE ?= 'ASC'
>
>  python () {
>      # Check sanity of configuration
> @@ -28,6 +32,10 @@ python () {
>          if not d.getVar(var, True):
>              raise_sanity_error("You need to define %s in the config" %
> var, d)
>
> +    sigtype = d.getVar("PACKAGE_FEED_GPG_SIGNATURE_TYPE", True)
> +    if sigtype.upper() != "ASC" and sigtype.upper() != "BIN":
> +        raise_sanity_error("Bad value for PACKAGE_FEED_GPG_SIGNATURE_TYPE
> (%s), use either ASC or BIN" % sigtype)
> +
>      # Set expected location of the public key
>      d.setVar('PACKAGE_FEED_GPG_PUBKEY',
>               os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
> diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
> index 8bcabee..840b6ca 100644
> --- a/meta/classes/sign_rpm.bbclass
> +++ b/meta/classes/sign_rpm.bbclass
> @@ -9,6 +9,10 @@
>  #           Optional variable for specifying the backend to use for
> signing.
>  #           Currently the only available option is 'local', i.e. local
> signing
>  #           on the build host.
> +# RPM_GPG_SIGNATURE_TYPE
> +#           Optional variable for specifying the type of gpg signatures,
> can be:
> +#                     1. Ascii armored (ASC), default if not set
> +#                     2. Binary (BIN)
>  # GPG_BIN
>  #           Optional variable for specifying the gpg binary/wrapper to
> use for
>  #           signing.
> @@ -19,6 +23,7 @@ inherit sanity
>
>  RPM_SIGN_PACKAGES='1'
>  RPM_GPG_BACKEND ?= 'local'
> +RPM_GPG_SIGNATURE_TYPE ?= 'BIN'
>
>
>  python () {
> @@ -27,6 +32,10 @@ python () {
>          if not d.getVar(var, True):
>              raise_sanity_error("You need to define %s in the config" %
> var, d)
>
> +    sigtype = d.getVar("RPM_GPG_SIGNATURE_TYPE", True)
> +    if sigtype.upper() != "ASC" and sigtype.upper() != "BIN":
> +        raise_sanity_error("Bad value for RPM_GPG_SIGNATURE_TYPE (%s),
> use either ASC or BIN" % sigtype)
> +
>      # Set the expected location of the public key
>      d.setVar('RPM_GPG_PUBKEY',
> os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
>                                              'RPM-GPG-PUBKEY'))
> @@ -39,7 +48,8 @@ python sign_rpm () {
>      signer = get_signer(d,
>                          d.getVar('RPM_GPG_BACKEND', True),
>                          d.getVar('RPM_GPG_NAME', True),
> -                        d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
> +                        d.getVar('RPM_GPG_PASSPHRASE_FILE', True),
> +                        d.getVar('RPM_GPG_SIGNATURE_TYPE', True))
>      rpms = glob.glob(d.getVar('RPM_PKGWRITEDIR', True) + '/*')
>
>      signer.sign_rpms(rpms)
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index 55abad8..d971d32 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -6,9 +6,10 @@ import oe.utils
>
>  class LocalSigner(object):
>      """Class for handling local (on the build host) signing"""
> -    def __init__(self, d, keyid, passphrase_file):
> +    def __init__(self, d, keyid, passphrase_file, signature_type):
>          self.keyid = keyid
>          self.passphrase_file = passphrase_file
> +        self.gpg_sig_type = signature_type
>          self.gpg_bin = d.getVar('GPG_BIN', True) or \
>                    bb.utils.which(os.getenv('PATH'), 'gpg')
>          self.gpg_path = d.getVar('GPG_PATH', True)
> @@ -16,10 +17,12 @@ class LocalSigner(object):
>
>      def export_pubkey(self, output_file):
>          """Export GPG public key to a file"""
> -        cmd = '%s --batch --yes --export --armor -o %s ' % \
> +        cmd = '%s --batch --yes --export -o %s ' % \
>                  (self.gpg_bin, output_file)
>          if self.gpg_path:
>              cmd += "--homedir %s " % self.gpg_path
> +        if self.gpg_sig_type == "ASC":
> +            cmd += "-a "
>          cmd += self.keyid
>          status, output = oe.utils.getstatusoutput(cmd)
>          if status:
> @@ -59,6 +62,8 @@ class LocalSigner(object):
>                    (self.gpg_bin, self.passphrase_file, self.keyid)
>          if self.gpg_path:
>              gpg_cmd += "--homedir %s " % self.gpg_path
> +        if self.gpg_sig_type == "ASC":
> +            cmd += "-a "
>          cmd += input_file
>          status, output = oe.utils.getstatusoutput(cmd)
>          if status:
> @@ -66,11 +71,11 @@ class LocalSigner(object):
>                                        (input_file, output))
>
>
> -def get_signer(d, backend, keyid, passphrase_file):
> +def get_signer(d, backend, keyid, passphrase_file, signature_type):
>      """Get signer object for the specified backend"""
>      # Use local signing by default
>      if backend == 'local':
> -        return LocalSigner(d, keyid, passphrase_file)
> +        return LocalSigner(d, keyid, passphrase_file, signature_type)
>      else:
>          bb.fatal("Unsupported signing backend '%s'" % backend)
>
> diff --git a/meta/lib/oe/package_manager.py
> b/meta/lib/oe/package_manager.py
> index 26f6466..7ea523a 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -113,7 +113,8 @@ class RpmIndexer(Indexer):
>              signer = get_signer(self.d,
>                                  self.d.getVar('PACKAGE_FEED_GPG_BACKEND',
> True),
>                                  self.d.getVar('PACKAGE_FEED_GPG_NAME',
> True),
> -
> self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
> +
> self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True),
> +
> self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE', True))
>          else:
>              signer = None
>          index_cmds = []
> diff --git a/meta/recipes-core/meta/signing-keys.bb
> b/meta/recipes-core/meta/signing-keys.bb
> index d7aa79d..82c8c59 100644
> --- a/meta/recipes-core/meta/signing-keys.bb
> +++ b/meta/recipes-core/meta/signing-keys.bb
> @@ -29,7 +29,8 @@ python do_export_public_keys () {
>          signer = get_signer(d,
>                              d.getVar('RPM_GPG_BACKEND', True),
>                              d.getVar('RPM_GPG_NAME', True),
> -                            d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
> +                            d.getVar('RPM_GPG_PASSPHRASE_FILE', True),
> +                            d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE',
> True))
>          signer.export_pubkey(d.getVar('RPM_GPG_PUBKEY', True))
>
>      if d.getVar('PACKAGE_FEED_SIGN', True) == '1':
> @@ -37,7 +38,8 @@ python do_export_public_keys () {
>          signer = get_signer(d,
>                              d.getVar('PACKAGE_FEED_GPG_BACKEND', True),
>                              d.getVar('PACKAGE_FEED_GPG_NAME', True),
> -                            d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE',
> True))
> +                            d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE',
> True),
> +                            d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE',
> True))
>          signer.export_pubkey(d.getVar('PACKAGE_FEED_GPG_PUBKEY', True))
>  }
>  addtask do_export_public_keys before do_build
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0158b404e86eee052be1cccc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div><br></div><div>This is an awesome p=
atch, but sadly it conflicts with Markus&#39;s refactor of related code.=C2=
=A0 Can you rebase this on top of Markus&#39;s work?=C2=A0 If you can&#39;t=
 find it on the list, then it&#39;s also staging in my poky-contrib:ross/mu=
t branch.</div><div><br></div><div>Thanks,</div><div>Ross</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 9 February 2016 at 1=
4:22, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.rati=
u@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">ASC =3D ascii armoured, BIN =3D binary<br>
<br>
Create new variables + parameters to the gpg signer module to specify<br>
which type of gpg signature to generate (ASC or BIN).<br>
<br>
The rpm backend has already implemented signatures which default to<br>
binary, so its behaviour is unchanged by this.<br>
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
>adrian.ratiu@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sign_package_feed.bbclass | 10 +++++++++-<br>
=C2=A0meta/classes/sign_rpm.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 =
+++++++++++-<br>
=C2=A0meta/lib/oe/gpg_sign.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 13 +++++++++----<br>
=C2=A0meta/lib/oe/package_manager.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 3 ++-<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://signing-keys.bb" rel=3D"nore=
ferrer" target=3D"_blank">signing-keys.bb</a> |=C2=A0 6 ++++--<br>
=C2=A05 files changed, 35 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_pac=
kage_feed.bbclass<br>
index d5df8af..4e703f2 100644<br>
--- a/meta/classes/sign_package_feed.bbclass<br>
+++ b/meta/classes/sign_package_feed.bbclass<br>
@@ -10,6 +10,10 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Optional variable for speci=
fying the backend to use for signing.<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Currently the only availabl=
e option is &#39;local&#39;, i.e. local signing<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on the build host.<br>
+# PACKAGE_FEED_GPG_SIGNATURE_TYPE<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Optional variable for specifying=
 the type of gpg signature, can be:<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01. Ascii armored (=
ASC), default if not set<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02. Binary (BIN)<br=
>
=C2=A0# GPG_BIN<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Optional variable for speci=
fying the gpg binary/wrapper to use for<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signing.<br>
@@ -20,7 +24,7 @@ inherit sanity<br>
<br>
=C2=A0PACKAGE_FEED_SIGN =3D &#39;1&#39;<br>
=C2=A0PACKAGE_FEED_GPG_BACKEND ?=3D &#39;local&#39;<br>
-<br>
+PACKAGE_FEED_GPG_SIGNATURE_TYPE ?=3D &#39;ASC&#39;<br>
<br>
=C2=A0python () {<br>
=C2=A0 =C2=A0 =C2=A0# Check sanity of configuration<br>
@@ -28,6 +32,10 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not d.getVar(var, True):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise_sanity_error(&quot;Yo=
u need to define %s in the config&quot; % var, d)<br>
<br>
+=C2=A0 =C2=A0 sigtype =3D d.getVar(&quot;PACKAGE_FEED_GPG_SIGNATURE_TYPE&q=
uot;, True)<br>
+=C2=A0 =C2=A0 if sigtype.upper() !=3D &quot;ASC&quot; and sigtype.upper() =
!=3D &quot;BIN&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise_sanity_error(&quot;Bad value for PACKAGE=
_FEED_GPG_SIGNATURE_TYPE (%s), use either ASC or BIN&quot; % sigtype)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Set expected location of the public key<br>
=C2=A0 =C2=A0 =C2=A0d.setVar(&#39;PACKAGE_FEED_GPG_PUBKEY&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(d.getVar(&#39=
;STAGING_ETCDIR_NATIVE&#39;, False),<br>
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass<=
br>
index 8bcabee..840b6ca 100644<br>
--- a/meta/classes/sign_rpm.bbclass<br>
+++ b/meta/classes/sign_rpm.bbclass<br>
@@ -9,6 +9,10 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Optional variable for speci=
fying the backend to use for signing.<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Currently the only availabl=
e option is &#39;local&#39;, i.e. local signing<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on the build host.<br>
+# RPM_GPG_SIGNATURE_TYPE<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Optional variable for specifying=
 the type of gpg signatures, can be:<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A01. Ascii armored (ASC), default if not set<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A02. Binary (BIN)<br>
=C2=A0# GPG_BIN<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Optional variable for speci=
fying the gpg binary/wrapper to use for<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signing.<br>
@@ -19,6 +23,7 @@ inherit sanity<br>
<br>
=C2=A0RPM_SIGN_PACKAGES=3D&#39;1&#39;<br>
=C2=A0RPM_GPG_BACKEND ?=3D &#39;local&#39;<br>
+RPM_GPG_SIGNATURE_TYPE ?=3D &#39;BIN&#39;<br>
<br>
<br>
=C2=A0python () {<br>
@@ -27,6 +32,10 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not d.getVar(var, True):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise_sanity_error(&quot;Yo=
u need to define %s in the config&quot; % var, d)<br>
<br>
+=C2=A0 =C2=A0 sigtype =3D d.getVar(&quot;RPM_GPG_SIGNATURE_TYPE&quot;, Tru=
e)<br>
+=C2=A0 =C2=A0 if sigtype.upper() !=3D &quot;ASC&quot; and sigtype.upper() =
!=3D &quot;BIN&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise_sanity_error(&quot;Bad value for RPM_GPG=
_SIGNATURE_TYPE (%s), use either ASC or BIN&quot; % sigtype)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Set the expected location of the public key<br>
=C2=A0 =C2=A0 =C2=A0d.setVar(&#39;RPM_GPG_PUBKEY&#39;, os.path.join(d.getVa=
r(&#39;STAGING_ETCDIR_NATIVE&#39;, False),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;RPM-GPG-PUBKEY&#39;))<br>
@@ -39,7 +48,8 @@ python sign_rpm () {<br>
=C2=A0 =C2=A0 =C2=A0signer =3D get_signer(d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0d.getVar(&#39;RPM_GPG_BACKEND&#39;, True),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0d.getVar(&#39;RPM_GPG_NAME&#39;, True),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 d.getVar(&#39;RPM_GPG_PASSPHRASE_FILE&#39;, True))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 d.getVar(&#39;RPM_GPG_PASSPHRASE_FILE&#39;, True),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 d.getVar(&#39;RPM_GPG_SIGNATURE_TYPE&#39;, True))<br>
=C2=A0 =C2=A0 =C2=A0rpms =3D glob.glob(d.getVar(&#39;RPM_PKGWRITEDIR&#39;, =
True) + &#39;/*&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0signer.sign_rpms(rpms)<br>
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py<br>
index 55abad8..d971d32 100644<br>
--- a/meta/lib/oe/gpg_sign.py<br>
+++ b/meta/lib/oe/gpg_sign.py<br>
@@ -6,9 +6,10 @@ import oe.utils<br>
<br>
=C2=A0class LocalSigner(object):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Class for handling local (on the buil=
d host) signing&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 def __init__(self, d, keyid, passphrase_file):<br>
+=C2=A0 =C2=A0 def __init__(self, d, keyid, passphrase_file, signature_type=
):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.keyid =3D keyid<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.passphrase_file =3D passphrase_file<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.gpg_sig_type =3D signature_type<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.gpg_bin =3D d.getVar(&#39;GPG_BIN&#3=
9;, True) or \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.uti=
ls.which(os.getenv(&#39;PATH&#39;), &#39;gpg&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.gpg_path =3D d.getVar(&#39;GPG_PATH&=
#39;, True)<br>
@@ -16,10 +17,12 @@ class LocalSigner(object):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def export_pubkey(self, output_file):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Export GPG public key t=
o a file&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;%s --batch --yes --export --armor=
 -o %s &#39; % \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;%s --batch --yes --export -o %s &=
#39; % \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(self.gpg_bin=
, output_file)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.gpg_path:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd +=3D &quot;--homedir %s=
 &quot; % self.gpg_path<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.gpg_sig_type =3D=3D &quot;ASC&quot;:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D &quot;-a &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd +=3D self.keyid<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status, output =3D oe.utils.getstatusoutp=
ut(cmd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if status:<br>
@@ -59,6 +62,8 @@ class LocalSigner(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(self.=
gpg_bin, self.passphrase_file, self.keyid)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.gpg_path:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpg_cmd +=3D &quot;--homedi=
r %s &quot; % self.gpg_path<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.gpg_sig_type =3D=3D &quot;ASC&quot;:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D &quot;-a &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd +=3D input_file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status, output =3D oe.utils.getstatusoutp=
ut(cmd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if status:<br>
@@ -66,11 +71,11 @@ class LocalSigner(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(input_fi=
le, output))<br>
<br>
<br>
-def get_signer(d, backend, keyid, passphrase_file):<br>
+def get_signer(d, backend, keyid, passphrase_file, signature_type):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Get signer object for the specified b=
ackend&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0# Use local signing by default<br>
=C2=A0 =C2=A0 =C2=A0if backend =3D=3D &#39;local&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return LocalSigner(d, keyid, passphrase_file)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return LocalSigner(d, keyid, passphrase_file, =
signature_type)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(&quot;Unsupported signing backen=
d &#39;%s&#39;&quot; % backend)<br>
<br>
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.p=
y<br>
index 26f6466..7ea523a 100644<br>
--- a/meta/lib/oe/package_manager.py<br>
+++ b/meta/lib/oe/package_manager.py<br>
@@ -113,7 +113,8 @@ class RpmIndexer(Indexer):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signer =3D get_signer(self.=
d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.d.getVar(&#39;PACKAGE_FEE=
D_GPG_BACKEND&#39;, True),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.d.getVar(&#39;PACKAGE_FEE=
D_GPG_NAME&#39;, True),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.d.getVar(&#39;PACKAGE_FEED_GPG_=
PASSPHRASE_FILE&#39;, True))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.d.getVar(&#39;PACKAGE_FEED_GPG_=
PASSPHRASE_FILE&#39;, True),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.d.getVar(&#39;PACKAGE_FEED_GPG_=
SIGNATURE_TYPE&#39;, True))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signer =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index_cmds =3D []<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://signing-keys.bb" rel=
=3D"noreferrer" target=3D"_blank">signing-keys.bb</a> b/meta/recipes-core/m=
eta/<a href=3D"http://signing-keys.bb" rel=3D"noreferrer" target=3D"_blank"=
>signing-keys.bb</a><br>
index d7aa79d..82c8c59 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://signing-keys.bb" rel=3D"nore=
ferrer" target=3D"_blank">signing-keys.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://signing-keys.bb" rel=3D"nore=
ferrer" target=3D"_blank">signing-keys.bb</a><br>
@@ -29,7 +29,8 @@ python do_export_public_keys () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signer =3D get_signer(d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&#39;RPM_GPG_BACKEND&#39;, True),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&#39;RPM_GPG_NAME&#39;, True),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;RPM_GPG_PASSPHRASE_FILE&#39;, True))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;RPM_GPG_PASSPHRASE_FILE&#39;, True),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;PACKAGE_FEED_GPG_SIGNATURE_TYPE&#39;=
, True))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signer.export_pubkey(d.getVar(&#39;RPM_GP=
G_PUBKEY&#39;, True))<br>
<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;PACKAGE_FEED_SIGN&#39;, True) =3D=3D &=
#39;1&#39;:<br>
@@ -37,7 +38,8 @@ python do_export_public_keys () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signer =3D get_signer(d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&#39;PACKAGE_FEED_GPG_BACKEND&#39;,=
 True),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&#39;PACKAGE_FEED_GPG_NAME&#39;, Tr=
ue),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;PACKAGE_FEED_GPG_PASSPHRASE_FILE&#39=
;, True))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;PACKAGE_FEED_GPG_PASSPHRASE_FILE&#39=
;, True),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;PACKAGE_FEED_GPG_SIGNATURE_TYPE&#39;=
, True))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signer.export_pubkey(d.getVar(&#39;PACKAG=
E_FEED_GPG_PUBKEY&#39;, True))<br>
=C2=A0}<br>
=C2=A0addtask do_export_public_keys before do_build<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--089e0158b404e86eee052be1cccc--
