Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.8866.1629535590601690263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 01:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ItLrLmMO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id x12so17600686wrr.11
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 01:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8WSDmRdl1ulU14Hpx/3RNYN7UWH3pj727QVToSvzmIM=;
        b=ItLrLmMODbZ2HPjAut2G8ByHClCOt4bjkiKvAkOHWK72YEl+EMcAoyEdiQjbnUe+ok
         S40eG7dK0UjFw8XU10lN8ZpnYq6gUV5Dhjcj5P7Y+GARnxVaSgLhaCfZmJkRHbnVK6wk
         pAqIpR/5poy9zcAjwGpwcvNWVAwA+w151EJY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8WSDmRdl1ulU14Hpx/3RNYN7UWH3pj727QVToSvzmIM=;
        b=gIgHwt1/lcjBLczICGAIAM0aeAmiwxHV79RD+lLOJDJafItJ2gHNlN7/Oo7iZYE45d
         PbGGJaBmlIUXfFVHYtf3ppZOcXUqUNFePn+5RMoAIr4QyLuOgeXghhj+7zkCitnFZEyE
         5SgHOFg5qugBFwxYZAX9jwXb6NchBqLklObQfHwIbA77FXsxWKwKYkoOCcHebjT/Zz1d
         poFA3thAKrCRQ+h80Ithn9MOV+STo4ZjwiaHanpu6Wuc6GmS0Mm0hYajg2R1QxnddQOy
         Bnp6W2c4sbakzY0jyS3hJ3WD9nwyDdzDM3td4oYGnZzPifuNbi5JDWlSHw50Z32QIkkQ
         6Scw==
X-Gm-Message-State: AOAM530Ug3k5knX+xM04qocjO8ruxyhdl/yvRdmZGf8C9py+iDFQO7r/
	Qp36+FJqat2pJDejHUAQd4q5DA==
X-Google-Smtp-Source: ABdhPJxMhmamuEOC/jSGbwikvoa8zBmXBv2WU2heADb+I9e0cEiQhO/ll5asqp3U3N/GPUl5ACXzcg==
X-Received: by 2002:a05:6000:9:: with SMTP id h9mr3015360wrx.396.1629535589063;
        Sat, 21 Aug 2021 01:46:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:789f:44c2:e113:215? ([2001:8b0:aba:5f3c:789f:44c2:e113:215])
        by smtp.gmail.com with ESMTPSA id l19sm7550833wmi.4.2021.08.21.01.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 01:46:28 -0700 (PDT)
Message-ID: <62d43fe7baaba2b70946b7598afc30026a7e50db.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io, 
 cardoe@cardoe.com, dev@codyps.com, tylerwhall@gmail.com, Khem Raj
 <raj.khem@gmail.com>, vinay.kumar@blackfigtech.com,
 saul.wold@windriver.com,  martin.jansa@gmail.com, paul@pbarker.dev, Trevor
 Gamblin <trevor.gamblin@windriver.com>, anbelski@linux.microsoft.com, Vinay
 Kumar <vinay.m.engg@gmail.com>
Date: Sat, 21 Aug 2021 09:46:27 +0100
In-Reply-To: <56e32f4e-3a48-fa45-1b6e-bb1dc549a8e4@windriver.com>
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
	 <20210813151947.55142-1-vinay.m.engg@gmail.com>
	 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
	 <169C1FA457B99CA0.23238@lists.openembedded.org>
	 <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
	 <56e32f4e-3a48-fa45-1b6e-bb1dc549a8e4@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I had a look at this. I agree the output from the test isn't great so I:

oe-selftest -r sstatetests.SStateTests.test_sstate_noop_samesigs -j 1

then since you want to pick the earliest difference:

bitbake-diffsigs ../build-st-3665/tmp-sstatesamehash*/stamps/x86_64-linux/cargo-native/1.54.0-r0.do_configure.sigdata.*

since if a -native is differing, you'd start there. That reports:

Hash for dependent task cargo/cargo_1.54.0.bb:do_prepare_recipe_sysroot:virtual:native changed from 0eb4be5c1555696edece016e7497ed4b7a24ed1e601e4625187232b527ee9cbb to 6763576bba0c95e56b40093399df3f96ba386638f0bbe1cb405541f120128a92

so ok:

bitbake-diffsigs ../build-st-3665/tmp-sstatesamehash*/stamps/x86_64-linux/cargo-native/1.54.0-r0.do_prepare*.sigdata.*

Hash for dependent task rust/rust_1.54.0.bb:do_populate_sysroot:virtual:native changed from d0e0b66258d63cf6a75427dc8ee99f365edc2858087dd251924f533ead085237 to 5a7ea7762b43c59386f4f8914b98d17d4381f00f08685e429d22121157e3c58c

So rust-native comes before cargo-native. Lets try the earliest rust-native we can see:

bitbake-diffsigs ../build-st-3665/tmp-sstatesamehash*/stamps/x86_64-linux/rust-native/1.54.0-r0.do_configure*.sigdata.*
NOTE: Starting bitbake server...
basehash changed from d4562518270a3e161b7e4fef4c7b39a66ca6e32e3ae3612f4ae1623501701278 to 01cacaecd08c1d41745eaf981c5f8896d48faf755b596bfca62f52a4c35f4ea7
Variable http_proxy value changed from 'http://example.com/' to ''

So it still thinks http_proxy is an issue. Why?

bitbake-dumpsig ../build-st-3665/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/1.54.0-r0.do_configure*.sigdata.* | grep http

Task dependencies: ['AR', 'AS', 'B', 'BASEDEPENDS', 'BASELIB', 'BUILD_AR',
'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH',
'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS',
'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM',
'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP',
'BUILD_SYS', 'BUILD_VENDOR', 'CARGO_DISABLE_BITBAKE_VENDORING', 'CARGO_HOME',
'CARGO_RUST_TARGET_CCLD', 'CARGO_VENDORING_DIRECTORY', 'CC', 'CCLD', 'CFLAGS',
'CONFIG_SITE', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD',
'DEPENDS', 'DISABLE_STATIC', 'EXTERNALSRC', 'EXTRA_NATIVE_PKGCONFIG_PATH',
'EXTRA_OECARGO_PATHS', 'EXTRA_OECONF', 'FC', 'FORCE_CRATE_HASH', 'HOST_ARCH',
'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR',
'INHIBIT_DEFAULT_RUST_DEPS', 'INSANE_SKIP', 'LC_ALL', 'LD', 'LDFLAGS', 'MAKE',
'MLPREFIX', 'NATIVE_PACKAGE_PATH_SUFFIX', 'NM', 'OBJCOPY', 'OBJDUMP', 'P',
'PACKAGECONFIG', 'PERL_HASH_SEED', 'PKG_CONFIG_ALLOW_CROSS', 'PKG_CONFIG_DIR',
'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH',
'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PSEUDO_DISABLED', 'PV', 'PYTHONHASHSEED',
'QA_LOGFILE', 'QA_SANE', 'RANLIB', 'READELF', 'RECIPE_SYSROOT_NATIVE',
'RUSTSRC', 'RUST_ALTERNATE_EXE_PATH', 'RUST_BUILD_CC', 'RUST_BUILD_CCLD',
'RUST_BUILD_CXX', 'RUST_TARGET_CC', 'RUST_TARGET_CCLD', 'RUST_TARGET_CXX',
'RUST_TARGET_PATH', 'S', 'SNAPSHOT_BUILD_SYS', 'SOURCE_DATE_EPOCH_FALLBACK',
'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_BINDIR_NATIVE', 'STAGING_DATADIR',
'STAGING_DATADIR_NATIVE', 'STAGING_DIR_NATIVE', 'STAGING_ETCDIR_NATIVE',
'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE',
'STAGING_SBINDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_OS',
'TARGET_SYS', 'TARGET_VENDOR', 'TZ', 'UNKNOWN_CONFIGURE_WHITELIST',
'WRAPPER_DIR', 'WRAPPER_TARGET_AR', 'WRAPPER_TARGET_CC', 'WRAPPER_TARGET_CCLD',
'WRAPPER_TARGET_CXX', 'WRAPPER_TARGET_LDFLAGS', 'YOCTO_ALTERNATE_EXE_PATH',
'YOCTO_ALTERNATE_MULTILIB_NAME', 'base_bindir', 'base_libdir',
'base_libdir_native', 'base_prefix', 'base_sbindir', 'bindir', 'bindir_native',
'cargo_common_do_configure', 'datadir', 'datadir_native', 'do_qa_configure',
'docdir', 'exec_prefix', 'http_proxy', 'includedir', 'includedir_native',
'infodir', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
'lt_cv_sys_lib_dlsearch_path_spec', 'mandir', 'nonarch_base_libdir',
'nonarch_libdir', 'oldincludedir', 'package_qa_handle_error',
'package_qa_write_error', 'prefix', 'prefix_native', 'root_prefix',
'rust_base_dep', 'rustlibdir', 'sbindir', 'sbindir_native', 'servicedir',
'setup_cargo_environment', 'sharedstatedir', 'sysconfdir', 'sysconfdir_native',
'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
List of dependencies for variable cargo_common_do_configure is {'mandir',
'PKG_CONFIG_PATH', 'RUST_TARGET_PATH', 'BUILD_CXXFLAGS',
'CARGO_VENDORING_DIRECTORY', 'RANLIB', 'BUILD_LDFLAGS', 'TZ', 'BUILD_FC',
'PERL_HASH_SEED', 'BUILD_CPPFLAGS', 'S', 'base_prefix', 'datadir', 'LD',
'CPPFLAGS', 'SOURCE_DATE_EPOCH_FALLBACK', 'BUILD_CXX', 'libexecdir',
'nonarch_base_libdir', 'CARGO_RUST_TARGET_CCLD',
'CARGO_DISABLE_BITBAKE_VENDORING', 'AR', 'BUILD_CFLAGS',
'PKG_CONFIG_ALLOW_CROSS', 'http_proxy', 'lt_cv_sys_lib_dlsearch_path_spec',
'STAGING_ETCDIR_NATIVE', 'PKG_CONFIG_DIR', 'systemd_unitdir', 'MAKE',
'HOST_SYS', 'CPP', 'WRAPPER_TARGET_CCLD', 'RUST_BUILD_CCLD', 'FC',
'YOCTO_ALTERNATE_MULTILIB_NAME', 'LDFLAGS', 'CXXFLAGS', 'BUILD_LD', 'BUILD_NM',
'prefix', 'BUILD_AR', 'systemd_system_unitdir', 'libdir', 'WRAPPER_TARGET_AR',
'EXTERNALSRC', 'WRAPPER_TARGET_LDFLAGS', 'CONFIG_SITE', 'CFLAGS', 'STRIP',
'oldincludedir', 'base_bindir', 'systemd_user_unitdir', 'infodir', 'READELF',
'BUILD_CC', 'CARGO_HOME', 'WRAPPER_TARGET_CXX', 'CXX', 'BUILD_SYS', 'CC',
'docdir', 'BUILD_CPP', 'BUILD_RANLIB', 'WRAPPER_TARGET_CC', 'NM', 'bindir',
'base_libdir', 'rustlibdir', 'includedir', 'B', 'exec_prefix', 'sbindir',
'LC_ALL', 'OBJDUMP', 'YOCTO_ALTERNATE_EXE_PATH', 'FORCE_CRATE_HASH',
'nonarch_libdir', 'PKG_CONFIG_SYSROOT_DIR', 'PSEUDO_DISABLED', 'BUILD_AS',
'CCLD', 'PKG_CONFIG_LIBDIR', 'EXTRA_OECARGO_PATHS', 'BUILD_STRIP',
'PKG_CONFIG_DISABLE_UNINSTALLED', 'sysconfdir', 'base_sbindir', 'AS',
'sharedstatedir', 'BUILD_CCLD', 'STRINGS', 'localstatedir', 'PYTHONHASHSEED',
'OBJCOPY', 'servicedir'}
List of dependencies for variable http_proxy is set()
	[http]
	# Multiplexing can't be enabled because http2 can't be enabled
	# if [ -n "${http_proxy}" ]; then
	#	echo "proxy = \"${http_proxy}\"" >> ${CARGO_HOME}/config

i.e. the lines you commented out are still there. Bitbake's shell parser isn't
clever enough to know to ignore that.

If you delete the lines, things are much happier!

Cheers,

Richard





