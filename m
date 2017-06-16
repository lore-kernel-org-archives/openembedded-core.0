Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 447B9783FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:07:46 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id u12so71334275qth.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QPw1TeZOxhPuqjPwV0hdGynxNXQdaA0/JOxxUZFKRzg=;
	b=ZIUp2mUBzw6hKWpcJnSPvbu2FuoeXHyr77JIceWDfh+noJqqQ7gGuNbKXOgiNbRI5h
	t5a+Kga76Lndjkn0/qbLc1AkWw2YHkkfyJUfOSx01IEszSlRcpew5cXWmLTjyGL5VAYV
	DBq53GBMmxMx1mNNw4Y/i9MQOkJQVaXEnBFLoaRZP7Z+vasRopeOytwHY+SsLugfqaU2
	WrE/gQwFKVfSHhKLCK9M/WYAfu8i+aanYxzS7vcLUf0COhRWG/ggsS1CAZ2kxOCtMTgE
	m0cD2c4h1VQKqPrWXArQRa7XeZJ7AKwdOCghEcpC2jOHyRQkH1USMSVKNJC2OUvLlq2E
	qVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QPw1TeZOxhPuqjPwV0hdGynxNXQdaA0/JOxxUZFKRzg=;
	b=NTRZvWHjB4Vnz8IFHfV/m35WOsFYEPv9AfsuJHb/NpUAhHxVbOjSeNR87LEoBVn+T4
	VzKT7Qjob5aCe4TNFymhDnHGBJuakzhZuVMcoMdY1ZsrEiSK1BreNQZGPlh0RF6EghBs
	G7ncRAVVMlJh7LrR1bBSyzyKqjjdk/u8oz4b93jq8MKkGsDIirhKEpOW7xuO69Y7V4FW
	dSCwrkCfYtiE6abPmEHmnSZcNxX7/nG21h0fqwgPBwkdY7farCfYrKfrlDjgPAz3OaIK
	mOVDktvlSsBU9LId+6jfZhKNsn4XXoQllsBtRI0edU1YeVmsO7kdOsdRggUwFBImYUQR
	9zuA==
X-Gm-Message-State: AKS2vOzGBlyVL7SVmrGOJs+YwV82pR8+S/46gaHkI2uiaqz0WcTEw3kQ
	SM3RrNlLNatrA61RpRCHQyFON3bBhp3L
X-Received: by 10.55.102.214 with SMTP id a205mr13770268qkc.154.1497632868011; 
	Fri, 16 Jun 2017 10:07:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 16 Jun 2017 10:07:27 -0700 (PDT)
In-Reply-To: <7dc39347ac14d76dbdeb4d29cb63254dc559001f.1497632387.git.humberto.ibarra.lopez@intel.com>
References: <cover.1497632387.git.humberto.ibarra.lopez@intel.com>
	<7dc39347ac14d76dbdeb4d29cb63254dc559001f.1497632387.git.humberto.ibarra.lopez@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Jun 2017 18:07:27 +0100
Message-ID: <CAJTo0LbyA6q5ywJhKj6WUiozesJNo0ZqWrZsMhvW+k0Cei2QGw@mail.gmail.com>
To: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS
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
X-List-Received-Date: Fri, 16 Jun 2017 17:07:47 -0000
Content-Type: multipart/alternative; boundary="94eb2c0580a81a24e7055216d3de"

--94eb2c0580a81a24e7055216d3de
Content-Type: text/plain; charset="UTF-8"

On 16 June 2017 at 18:01, Humberto Ibarra <humberto.ibarra.lopez@intel.com>
wrote:

> +        image_name = 'core-image-minimal'
> +        clean_cmd = '-c clean %s' % image_name
> +        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
> +
> +        for pack_class in [ "rpm", "deb", "ipk"]:
> +            bitbake(clean_cmd)
> +            features = 'IMAGE_GEN_DEBUGFS = "1"\n'
> +            features += 'IMAGE_FSTYPES_DEBUGFS = "tar.bz2"\n'
> +            features += 'PACKAGE_CLASSES = "package_%s"' % pack_class
> +            self.write_config(features)
> +
> +            bitbake(image_name)
> +            debug_files = glob.glob(os.path.join(deploy_
> dir_image,"*-dbg.rootfs.tar.bz2"))
> +            self.assertNotEqual(len(debug_files), 0,
> +                    'debug filesystem not generated for %s' % pack_class)
> +
> +            deploy_packages_var = 'DEPLOY_DIR_%s' % pack_class.upper()
> +            debug_pack_files = glob.glob(os.path.join(get_bb_
> var(deploy_packages_var),
> +                    get_bb_var("MACHINE").replace("-","_"), "*-dbg*"))
> +            self.assertNotEqual(len(debug_pack_files), 0,
> +                    'debug packages not generated for %s' % pack_class)
>

Each call to get_bb_var() is a call to bitbake, so it's best to batch up
these as much as possible into a single get_bb_vars() call.

Also is there any point to checking that dbg packages were created?

Ross

--94eb2c0580a81a24e7055216d3de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2017 at 18:01, Humberto Ibarra <span dir=3D"ltr">&lt;<a href=3D"=
mailto:humberto.ibarra.lopez@intel.com" target=3D"_blank">humberto.ibarra.l=
opez@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":4mc" class=3D"a3s aXjCH m15cb1d6d7846f822">+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 image_name =3D &#39;core-image-minimal&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clean_cmd =3D &#39;-c clean %s&#39; % image_na=
me<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_dir_image =3D get_bb_var(&#39;DEPLOY_DI=
R_IMAGE&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for pack_class in [ &quot;rpm&quot;, &quot;deb=
&quot;, &quot;ipk&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(clean_cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D &#39;IMAGE_GEN_DEBU=
GFS =3D &quot;1&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;IMAGE_FSTYPES=
_DEBUGFS =3D &quot;tar.bz2&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;PACKAGE_CLASS=
ES =3D &quot;package_%s&quot;&#39; % pack_class<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(features)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(image_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug_files =3D glob.glob(os.pat=
h.join(deploy_<wbr>dir_image,&quot;*-dbg.rootfs.tar.<wbr>bz2&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertNotEqual(len(debug_<w=
br>files), 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;debug filesystem not generated for %s&#39; % pack_class)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_packages_var =3D &#39;DEP=
LOY_DIR_%s&#39; % pack_class.upper()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug_pack_files =3D glob.glob(o=
s.path.join(get_bb_<wbr>var(deploy_packages_var),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_=
bb_var(&quot;MACHINE&quot;).replace(<wbr>&quot;-&quot;,&quot;_&quot;), &quo=
t;*-dbg*&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertNotEqual(len(debug_<w=
br>pack_files), 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;debug packages not generated for %s&#39; % pack_class)</div></blockquote><=
/div><br>Each call to get_bb_var() is a call to bitbake, so it&#39;s best t=
o batch up these as much as possible into a single get_bb_vars() call.</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also is th=
ere any point to checking that dbg packages were created?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0580a81a24e7055216d3de--
