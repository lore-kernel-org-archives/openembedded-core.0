Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgwX-00013E-Ea
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:18:37 +0200
Received: by pbbrq2 with SMTP id rq2so1396384pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 14:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=/BbRYuNhM4Q0lae3YMqqQ6izwGu+HV9uo8IZzTWCHjM=;
	b=ZJ5vOU6spOiYBUK2cvhdVA83bKGaKED0uhb1jiyak37iWOjgEBU59WO4UZh9lkEDGO
	uLxrXyBA0lj2aMD7665ialwbyZI1MYY/yLL9qlyYhxOVi1J4INgZsZZAFxgc8IYeinS8
	hc5y0rQOJaHpt6MbQJmRzxyphqgUAjLdQ1GfkZCFl/OtyRhdjGYlYlW3CZi3jU95gtTP
	uqO5adkzclLcghmZVfIczjsGrxwm8xp75x600bTIKjW3x1ofC16VyHBl/ZWxygpTxrx1
	1Xz65M8Lj4/z+vBN5Lrf+uGLooQ7VaF+0KVgW3cdjjRBIpo5yjdog3Yp7cZlLUiRYwyB
	kYiQ==
Received: by 10.68.218.198 with SMTP id pi6mr809268pbc.121.1335992932009;
	Wed, 02 May 2012 14:08:52 -0700 (PDT)
Received: from [172.23.3.173] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id og6sm2978625pbb.42.2012.05.02.14.08.49
	(version=SSLv3 cipher=OTHER); Wed, 02 May 2012 14:08:50 -0700 (PDT)
Message-ID: <4FA1A25F.9030502@gmail.com>
Date: Wed, 02 May 2012 14:08:47 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
	<eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
	<20120502140940.GB3682@jama.jama.net>
In-Reply-To: <20120502140940.GB3682@jama.jama.net>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
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
X-List-Received-Date: Wed, 02 May 2012 21:18:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/02/2012 07:09 AM, Martin Jansa wrote:
> On Wed, May 02, 2012 at 03:59:45PM +0200, Martin Jansa wrote:
>> From: Tomas Frydrych <tomas@sleepfive.com>
>> 
>> These are required to build recent versions of glib-2.0
> 
> similar patch is needed also for other site files, just noticed it
> while building for qemux86-64

would you also include rest of architectures too please ?

> 
>> 
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
>> meta/site/arm-common |    3 +++ 1 files changed, 3 insertions(+),
>> 0 deletions(-)
>> 
>> diff --git a/meta/site/arm-common b/meta/site/arm-common index
>> c3ffe08..cad8027 100644 --- a/meta/site/arm-common +++
>> b/meta/site/arm-common @@ -76,6 +76,9 @@
>> glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4} 
>> glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4} 
>> glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4} 
>> glib_cv_sys_use_pid_niceness_surrogate=${glib_cv_sys_use_pid_niceness_surrogate=yes}
>>
>> 
+ac_cv_alignof_guint32=4
>> +ac_cv_alignof_guint64=8 +ac_cv_alignof_unsigned_long=4
>> 
>> #gstreamer as_cv_unaligned_access=${as_cv_unaligned_access=no} --
>>  1.7.8.6
>> 
> 
> 
> 
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+hol8ACgkQuwUzVZGdMxQEkgCfZY5mVAR5RxST2olpH41m6V+d
iQwAnRBaSrzbM/RGWmb8cZJjXwMAg6KJ
=tUvc
-----END PGP SIGNATURE-----


