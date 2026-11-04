Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8907.1793798463816163864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 05:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=FdwaGev4;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.42, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c40f5077425so10357666b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 05:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793798462; x=1794403262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rAT0p06uFiC/KOR/Q+yxGmPyBliloon1QjwJr4+/lBI=;
        b=FdwaGev4TZtr9q1F3gCBzGiNUbLiN6HTUWqF6ZmSOBRM+70TN90ISPCKbEb6gD3Nz+
         8IePcgRVf1KiHQP/FkBOqLrpGOdv0eLXCGrVVdXJMygloKg1H4hWp8Ilvysk7ugsq9Aa
         LQDiOpwUYrgY7ygErTX47WNl2g6vuHs67ygeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798462; x=1794403262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAT0p06uFiC/KOR/Q+yxGmPyBliloon1QjwJr4+/lBI=;
        b=L5rzUofuPIsGIUfFM8E6lF1W/bP9iX7VTDFqLjXvM9ypXKCdF0OJPnVCGdExzpS6mv
         ehBXg2dxhzjVCWmN1ijETJkMr86vpe48cTTXp0A/auPugiU8YUc8OZOjhRV04oilia28
         wJs/JDfEduoioQdy0ejYOWqJG+i9Ck9HqonJoO5RNNxs1AxAcoI12wCnn2CODtDuLDDO
         VTyHMa0WlV8hAI/BmxfTXPTUNIf/eN3gQTxfqSQc1RyU6THJTUae3nzCwcjxhjXoY9xg
         2tNC81UjbgjPJM7OrGWLM9gwiMm0dz65SecLkpkzfMydKby+O6hQHU9UKS8UnXyURHFA
         FDmw==
X-Gm-Message-State: APuU4Z/K4Lvb0m0CRS3n1nrf/iw88aTfg8Vg1TrRtOGq/yIpgsTMa2XO
	Rc+ppIoId5RW43Kff74+iM7MXpc8eFpiZyXldYMYFb0jd6TEaniWFtfDt0eYiKTXcMfl1opV0je
	oGAlLEqI=
X-Gm-Gg: AYBFou2ImYFgkMxFAWQ3OA3B+PNmgYlns6Kb0hhnKAehIlK4O9tXa5yj5CG13+YAiwt
	Sa1HzPRzK3l67jCg3E/iumaAhbU6nFePATyP2stDG/teZ78rVR8uSPmzXRe14DV/uw0t57hGe44
	WMHlBy66FnGpIOISIqbZnAmAW3y/tcCzZPYk2XuIyn7ggVcqwAOVPAFszfekZoKHyieZFisTak+
	iciK6S8bAMeWeX6j+FKqgFjE3rEltYuKVFfjDDU4isOokirlpWA8qytdTpju0VZ9TYl4TpLyBrq
	WpclVcpvPxp5Up6SHkdQyji/wXWIVVg/3ghMzyU0llwZqInSSEqLipvyaNcVWKNp7l/+HVS4Hfx
	dsjOm/EaFOjCE9h/YokHdU2i1SXgZq79MRKu5/v8N8o6B0c5QC3h/7Q7qooaHrEokr/2K2xxVKD
	4R8gqF7tSPo+659zommjR9/MLta0ynXF21c7NVPixdd89pTOly40/GwF4t+LILnc75GenMYDEiV
	0hMDVm+O/VHA0S4ZBi6PW3ogfUhSMkuSoQbU+bxoCqcfMBpqnj8qkblUBj7Q/QtszHroA+FpaYS
	NQWWW6uqlm7bjJecT1oPEMXu+cWPYYrqFFax1wb2tNrnX2sIAVc6gGOsqM0mTXxFirF2NyFO1h1
	WzBONOTVrY5FY8cOsw7PQWCfOZcBgPg4y9T7r0lMY2Ht3MR8WdCU7hkZryi73NvRGwTrgcrnUrG
	MK+dR57mbkEhrp+OWNa03PcQGsgtyTi1E=
X-Received: by 2002:a17:906:a005:b0:c29:4634:5c8f with SMTP id a640c23a62f3a-c4ca7405bffmr1437890366b.0.1793798461738;
        Wed, 04 Nov 2026 05:21:01 -0800 (PST)
Return-Path: <adam.duskett@amarulasolutions.com>
Received: from adam-linux.tail032493.ts.net (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e140f93sm70343466b.6.2026.11.04.05.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:20:59 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v12 1/4] libtoml1: fix building tests with gcc 16
Date: Wed,  4 Nov 2026 14:20:53 +0100
Message-ID: <20261104132057.607953-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 13:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249376
Content-Type: text/plain; charset="utf-8"

GCC 16 warns that the format may be used uninitialized when a value is
assigned a different type, for example:

  toml::value v(true);
  v = std::chrono::hours(1);

The warning is a false positive, but the tests build with -Werror, so
the build fails.

Every operator= copied the old format out of the union behind a type
check that GCC could not see through, so it flagged a possible read of
an inactive member.

Add a small helper that keeps the format when the type is unchanged and
uses the default format otherwise, so the old format is never copied.
The convenience overloads now convert their argument and forward to the
main ones, removing a lot of duplicated code.

Fixes:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/4814

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...e-uninitialized-warnings-in-operator.patch | 466 ++++++++++++++++++
 .../libtoml11/libtoml11_4.4.0.bb              |   1 +
 2 files changed, 467 insertions(+)
 create mode 100644 meta/recipes-devtools/libtoml11/files/0002-avoid-maybe-uninitialized-warnings-in-operator.patch

diff --git a/meta/recipes-devtools/libtoml11/files/0002-avoid-maybe-uninitialized-warnings-in-operator.patch b/meta/recipes-devtools/libtoml11/files/0002-avoid-maybe-uninitialized-warnings-in-operator.patch
new file mode 100644
index 0000000000..9de62ff3fc
--- /dev/null
+++ b/meta/recipes-devtools/libtoml11/files/0002-avoid-maybe-uninitialized-warnings-in-operator.patch
@@ -0,0 +1,466 @@
+From e53cc3da832cae3722b969e515b9f8612250377d Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Tue, 3 Nov 2026 15:08:49 +0100
+Subject: [PATCH] avoid maybe-uninitialized warnings in operator=
+
+GCC 16 warns that the format may be used uninitialized when a value is
+assigned a different type, for example:
+
+  toml::value v(true);
+  v = std::chrono::hours(1);
+
+The warning is a false positive, but the tests build with -Werror, so
+the build fails.
+
+Every operator= copied the old format out of the union behind a type
+check that GCC could not see through, so it flagged a possible read of
+an inactive member.
+
+Add a small helper that keeps the format when the type is unchanged and
+uses the default format otherwise, so the old format is never copied.
+The convenience overloads now convert their argument and forward to the
+main ones, removing a lot of duplicated code.
+
+Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/325]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ include/toml11/value.hpp | 293 ++++++++-------------------------------
+ 1 file changed, 57 insertions(+), 236 deletions(-)
+
+diff --git a/include/toml11/value.hpp b/include/toml11/value.hpp
+index 8b446a7..e512c3e 100644
+--- a/include/toml11/value.hpp
++++ b/include/toml11/value.hpp
+@@ -404,18 +404,8 @@ class basic_value
+     {}
+     basic_value& operator=(boolean_type x)
+     {
+-        boolean_format_info fmt;
+-        if(this->is_boolean())
+-        {
+-            fmt = this->as_boolean_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::boolean;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->boolean_, boolean_storage(x, fmt));
++        this->assign_keeping_format(value_t::boolean, this->boolean_,
++                                    std::move(x));
+         return *this;
+     }
+ 
+@@ -444,18 +434,8 @@ class basic_value
+     {}
+     basic_value& operator=(integer_type x)
+     {
+-        integer_format_info fmt;
+-        if(this->is_integer())
+-        {
+-            fmt = this->as_integer_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::integer;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->integer_, integer_storage(std::move(x), std::move(fmt)));
++        this->assign_keeping_format(value_t::integer, this->integer_,
++                                    std::move(x));
+         return *this;
+     }
+ 
+@@ -497,18 +477,7 @@ class basic_value
+     template<typename T, enable_if_integer_like_t<T> = nullptr>
+     basic_value& operator=(T x)
+     {
+-        integer_format_info fmt;
+-        if(this->is_integer())
+-        {
+-            fmt = this->as_integer_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::integer;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->integer_, integer_storage(x, std::move(fmt)));
++        *this = static_cast<integer_type>(x);
+         return *this;
+     }
+ 
+@@ -537,18 +506,8 @@ class basic_value
+     {}
+     basic_value& operator=(floating_type x)
+     {
+-        floating_format_info fmt;
+-        if(this->is_floating())
+-        {
+-            fmt = this->as_floating_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::floating;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->floating_, floating_storage(std::move(x), std::move(fmt)));
++        this->assign_keeping_format(value_t::floating, this->floating_,
++                                    std::move(x));
+         return *this;
+     }
+ 
+@@ -594,18 +553,7 @@ class basic_value
+     template<typename T, enable_if_floating_like_t<T> = nullptr>
+     basic_value& operator=(T x)
+     {
+-        floating_format_info fmt;
+-        if(this->is_floating())
+-        {
+-            fmt = this->as_floating_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::floating;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->floating_, floating_storage(x, std::move(fmt)));
++        *this = static_cast<floating_type>(x);
+         return *this;
+     }
+ 
+@@ -635,18 +583,8 @@ class basic_value
+     {}
+     basic_value& operator=(string_type x)
+     {
+-        string_format_info fmt;
+-        if(this->is_string())
+-        {
+-            fmt = this->as_string_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::string;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->string_, string_storage(x, std::move(fmt)));
++        this->assign_keeping_format(value_t::string, this->string_,
++                                    std::move(x));
+         return *this;
+     }
+ 
+@@ -674,18 +612,7 @@ class basic_value
+     {}
+     basic_value& operator=(const typename string_type::value_type* x)
+     {
+-        string_format_info fmt;
+-        if(this->is_string())
+-        {
+-            fmt = this->as_string_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::string;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->string_, string_storage(string_type(x), std::move(fmt)));
++        *this = string_type(x);
+         return *this;
+     }
+ 
+@@ -715,18 +642,7 @@ class basic_value
+     {}
+     basic_value& operator=(string_view_type x)
+     {
+-        string_format_info fmt;
+-        if(this->is_string())
+-        {
+-            fmt = this->as_string_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::string;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->string_, string_storage(string_type(x), std::move(fmt)));
++        *this = string_type(x);
+         return *this;
+     }
+ 
+@@ -779,18 +695,7 @@ class basic_value
+         >::value, std::nullptr_t> = nullptr>
+     basic_value& operator=(const T& x)
+     {
+-        string_format_info fmt;
+-        if(this->is_string())
+-        {
+-            fmt = this->as_string_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::string;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->string_, string_storage(detail::string_conv<string_type>(x), std::move(fmt)));
++        *this = detail::string_conv<string_type>(x);
+         return *this;
+     }
+ 
+@@ -820,18 +725,8 @@ class basic_value
+     {}
+     basic_value& operator=(local_date_type x)
+     {
+-        local_date_format_info fmt;
+-        if(this->is_local_date())
+-        {
+-            fmt = this->as_local_date_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::local_date;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->local_date_, local_date_storage(x, fmt));
++        this->assign_keeping_format(value_t::local_date, this->local_date_,
++                                    std::move(x));
+         return *this;
+     }
+ 
+@@ -861,18 +756,8 @@ class basic_value
+     {}
+     basic_value& operator=(local_time_type x)
+     {
+-        local_time_format_info fmt;
+-        if(this->is_local_time())
+-        {
+-            fmt = this->as_local_time_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::local_time;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->local_time_, local_time_storage(x, fmt));
++        this->assign_keeping_format(value_t::local_time, this->local_time_,
++                                    std::move(x));
+         return *this;
+     }
+ 
+@@ -901,18 +786,7 @@ class basic_value
+     template<typename Rep, typename Period>
+     basic_value& operator=(const std::chrono::duration<Rep, Period>& x)
+     {
+-        local_time_format_info fmt;
+-        if(this->is_local_time())
+-        {
+-            fmt = this->as_local_time_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::local_time;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->local_time_, local_time_storage(local_time_type(x), std::move(fmt)));
++        *this = local_time_type(x);
+         return *this;
+     }
+ 
+@@ -942,18 +816,8 @@ class basic_value
+     {}
+     basic_value& operator=(local_datetime_type x)
+     {
+-        local_datetime_format_info fmt;
+-        if(this->is_local_datetime())
+-        {
+-            fmt = this->as_local_datetime_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::local_datetime;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->local_datetime_, local_datetime_storage(x, fmt));
++        this->assign_keeping_format(value_t::local_datetime, this->local_datetime_,
++                                    std::move(x));
+         return *this;
+     }
+ 
+@@ -983,18 +847,8 @@ class basic_value
+     {}
+     basic_value& operator=(offset_datetime_type x)
+     {
+-        offset_datetime_format_info fmt;
+-        if(this->is_offset_datetime())
+-        {
+-            fmt = this->as_offset_datetime_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::offset_datetime;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->offset_datetime_, offset_datetime_storage(x, fmt));
++        this->assign_keeping_format(value_t::offset_datetime, this->offset_datetime_,
++                                    std::move(x));
+         return *this;
+     }
+ 
+@@ -1018,18 +872,7 @@ class basic_value
+     {}
+     basic_value& operator=(std::chrono::system_clock::time_point x)
+     {
+-        offset_datetime_format_info fmt;
+-        if(this->is_offset_datetime())
+-        {
+-            fmt = this->as_offset_datetime_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::offset_datetime;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->offset_datetime_, offset_datetime_storage(offset_datetime_type(x), fmt));
++        *this = offset_datetime_type(x);
+         return *this;
+     }
+ 
+@@ -1060,19 +903,8 @@ class basic_value
+     {}
+     basic_value& operator=(array_type x)
+     {
+-        array_format_info fmt;
+-        if(this->is_array())
+-        {
+-            fmt = this->as_array_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::array;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->array_, array_storage(
+-                    detail::storage<array_type>(std::move(x)), std::move(fmt)));
++        this->assign_keeping_format(value_t::array, this->array_,
++                                    detail::storage<array_type>(std::move(x)));
+         return *this;
+     }
+ 
+@@ -1124,21 +956,8 @@ class basic_value
+     template<typename T, enable_if_array_like_t<T> = nullptr>
+     basic_value& operator=(T x)
+     {
+-        array_format_info fmt;
+-        if(this->is_array())
+-        {
+-            fmt = this->as_array_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::array;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        array_type a(std::make_move_iterator(x.begin()),
+-                     std::make_move_iterator(x.end()));
+-        assigner(this->array_, array_storage(
+-                    detail::storage<array_type>(std::move(a)), std::move(fmt)));
++        *this = array_type(std::make_move_iterator(x.begin()),
++                           std::make_move_iterator(x.end()));
+         return *this;
+     }
+ 
+@@ -1169,19 +988,8 @@ class basic_value
+     {}
+     basic_value& operator=(table_type x)
+     {
+-        table_format_info fmt;
+-        if(this->is_table())
+-        {
+-            fmt = this->as_table_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::table;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        assigner(this->table_, table_storage(
+-            detail::storage<table_type>(std::move(x)), std::move(fmt)));
++        this->assign_keeping_format(value_t::table, this->table_,
++                                    detail::storage<table_type>(std::move(x)));
+         return *this;
+     }
+ 
+@@ -1231,21 +1039,8 @@ class basic_value
+     template<typename T, enable_if_table_like_t<T> = nullptr>
+     basic_value& operator=(T x)
+     {
+-        table_format_info fmt;
+-        if(this->is_table())
+-        {
+-            fmt = this->as_table_fmt();
+-        }
+-        this->cleanup();
+-        this->type_   = value_t::table;
+-        this->region_ = region_type{};
+-#ifdef TOML11_ENABLE_ACCESS_CHECK
+-        this->accessed_ = false;
+-#endif
+-        table_type t(std::make_move_iterator(x.begin()),
+-                     std::make_move_iterator(x.end()));
+-        assigner(this->table_, table_storage(
+-            detail::storage<table_type>(std::move(t)), std::move(fmt)));
++        *this = table_type(std::make_move_iterator(x.begin()),
++                           std::make_move_iterator(x.end()));
+         return *this;
+     }
+ 
+@@ -2083,6 +1878,32 @@ class basic_value
+         return;
+     }
+ 
++    // Assign a new value of type `ty`. If this already holds a value of that
++    // type, only the value is replaced and its format is kept. Otherwise the
++    // current value is destroyed and the new one gets the default format.
++    //
++    // The format of the inactive union member is never read, so compilers do
++    // not see a (false positive) maybe-uninitialized read through the union.
++    template<typename Storage>
++    void assign_keeping_format(const value_t ty, Storage& dst,
++                               typename Storage::value_type v)
++    {
++        if(this->type_ == ty)
++        {
++            dst.value = std::move(v);
++        }
++        else
++        {
++            this->cleanup();
++            this->type_ = ty;
++            assigner(dst, Storage(std::move(v), typename Storage::format_type{}));
++        }
++        this->region_ = region_type{};
++#ifdef TOML11_ENABLE_ACCESS_CHECK
++        this->accessed_ = false;
++#endif
++    }
++
+     template<typename T, typename U>
+     static void assigner(T& dst, U&& v)
+     {
diff --git a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index 49f9840f06..d9f0fa82f0 100644
--- a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "\
     gitsm://github.com/ToruNiina/toml11.git;protocol=https;branch=main;tag=v${PV} \
     file://0001-Remove-whitespace-in-operator.patch \
     file://0001-Remove-more-whitespaces-after-operator.patch \
+    file://0002-avoid-maybe-uninitialized-warnings-in-operator.patch \
     file://run-ptest \
 "
 SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
-- 
2.56.0

