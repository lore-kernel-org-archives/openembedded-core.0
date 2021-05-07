Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.16202.1620420604347429340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 13:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=niGAMJeB;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id j12so2171333pgh.7
        for <openembedded-core@lists.openembedded.org>; Fri, 07 May 2021 13:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NLjtrxzlqQEl4qA52Ifk54MjRGqCAgDmpa1P6hnhn68=;
        b=niGAMJeBbpZgYbkAlW0Ayez0AVouRvkWRjZcTyq7KJ1AUnbf7JQM7VBwJW41Cup51w
         IwrW2pq0IIp0p+cbWZp8vLv+L7fQfl4gZYY7B2rsoY2lzrPipUrCQbKA0RIb0LU3Z2Ze
         wUfoUYVuUrwzLJ0l4odRu6PTp2+zocd8QW00kfM7Vu7UtMlm1Dc19A0mw4ZT1o+T0R6N
         0QH7HBM3C7xtVroBAaX9xxhGryHau/uxCCxgHr7XRwuRqgria0uXHAbN+5iojAooUcO3
         2vjVPDRD3RFgc0MY+lB894CmgkNHpFbqFlSrXCT3LqGcbwsdzUFqVl6a92E1pAK6oZ6a
         eYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NLjtrxzlqQEl4qA52Ifk54MjRGqCAgDmpa1P6hnhn68=;
        b=aA6sclFaUJ7hkxpf5MakBfe7JCRwwofwzLopO/D8wMHy0QXnbSA8pP7Lt+jrbM+Smd
         bxCiHlpxVT0yHwtI5drW0fbC9Ckn1W4D2YxiaxQ+fYt8fxN399YmOhKMC6/i0NeGG7ca
         FfKxHmLcRjoze8l3di2xIMd4yN2a6oxE7KhR+Aoit4rswy1spgr2BWpmL3z7k+zqHwyR
         GMk9sGDVPWzBva+kOhO26YlPMhvD+Jj6U30qNMlUfXlsazaauTaKHlPeGjqOpKvff0be
         IEErxAk63pIB+kcQ81MRCSn52AxRNagVdKoQZYF6LvV+D/tPg1stSfvxCZoUBIHZdSMy
         oziQ==
X-Gm-Message-State: AOAM532vgPrEhSTW+xUaqaCS4r8xTC90ljlLn+S0q0uAD9m6K7IcCjQh
	eucDakvt5wJOhPsVTpmjrkBxbhcsiD/0YQ==
X-Google-Smtp-Source: ABdhPJwziZLCoh/lxbMCtrAnfSwazQXssRtYQr5V8Jc+icvTABEdajPqlIWbIaPFQvpO09tOOaSHpA==
X-Received: by 2002:a63:eb46:: with SMTP id b6mr11737916pgk.199.1620420602649;
        Fri, 07 May 2021 13:50:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id in1sm12717266pjb.23.2021.05.07.13.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 13:50:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] swig: Upgrade to 4.0.2
Date: Fri,  7 May 2021 13:49:59 -0700
Message-Id: <20210507204959.919171-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop backports and refresh patches to apply on 4.x series

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Add-Node-7.x-aka-V8-5.2-support.patch | 330 ------------------
 ...de-for-constant-expressions-containi.patch | 179 ----------
 ...e-for-swig-swiglib-on-non-Win32-plat.patch |  13 +-
 ...re-use-pkg-config-for-pcre-detection.patch |   7 +-
 ...-new-GCC8-warnings-in-generated-code.patch | 191 ----------
 .../swig/swig/determinism.patch               |   8 +-
 ...ue-reported-for-SWIG_Python_FixMetho.patch |  36 --
 meta/recipes-devtools/swig/swig_3.0.12.bb     |  13 -
 meta/recipes-devtools/swig/swig_4.0.2.bb      |   7 +
 9 files changed, 15 insertions(+), 769 deletions(-)
 delete mode 100644 meta/recipes-devtools/swig/swig/0001-Add-Node-7.x-aka-V8-5.2-support.patch
 delete mode 100644 meta/recipes-devtools/swig/swig/0001-Fix-generated-code-for-constant-expressions-containi.patch
 delete mode 100644 meta/recipes-devtools/swig/swig/Python-Fix-new-GCC8-warnings-in-generated-code.patch
 delete mode 100644 meta/recipes-devtools/swig/swig/swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch
 delete mode 100644 meta/recipes-devtools/swig/swig_3.0.12.bb
 create mode 100644 meta/recipes-devtools/swig/swig_4.0.2.bb

diff --git a/meta/recipes-devtools/swig/swig/0001-Add-Node-7.x-aka-V8-5.2-support.patch b/meta/recipes-devtools/swig/swig/0001-Add-Node-7.x-aka-V8-5.2-support.patch
deleted file mode 100644
index 885c395614..0000000000
--- a/meta/recipes-devtools/swig/swig/0001-Add-Node-7.x-aka-V8-5.2-support.patch
+++ /dev/null
@@ -1,330 +0,0 @@
-From 1a5aadcd66e85c63d228bfd811a521d617c22a38 Mon Sep 17 00:00:00 2001
-From: Patrick Schneider <patrick.schneider@meetnow.eu>
-Date: Thu, 13 Apr 2017 15:02:53 +0200
-Subject: [PATCH] Add Node 7.x aka V8 5.2+ support
-
-* Use WeakCallbackInfo instead of WeakCallbackData
-* Use GetPrivate instead of GetHiddenValue
-* Adopted new signature for SetWeak to support destructor calling
-* SetAccessor deprecation fixed
-* Proper version checks where applicable
-
-Upstream-Status: Submitted [https://github.com/swig/swig/pull/968]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
----
- Lib/javascript/v8/javascriptcode.swg    | 27 +++++++++++++++++-----
- Lib/javascript/v8/javascripthelpers.swg | 29 +++++++++++++++++++++---
- Lib/javascript/v8/javascriptinit.swg    | 16 +++++++++++--
- Lib/javascript/v8/javascriptrun.swg     | 40 ++++++++++++++++++++++++++++-----
- 4 files changed, 95 insertions(+), 17 deletions(-)
-
-diff --git a/Lib/javascript/v8/javascriptcode.swg b/Lib/javascript/v8/javascriptcode.swg
-index fb7d55c..b8c5089 100644
---- a/Lib/javascript/v8/javascriptcode.swg
-+++ b/Lib/javascript/v8/javascriptcode.swg
-@@ -133,10 +133,13 @@ static void $jswrapper(v8::Isolate *isolate, v8::Persistent<v8::Value> object, v
-   SWIGV8_Proxy *proxy = static_cast<SWIGV8_Proxy *>(parameter);
- #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
- static void $jswrapper(v8::Isolate *isolate, v8::Persistent<v8::Object> *object, SWIGV8_Proxy *proxy) {
--#else
-+#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
- static void $jswrapper(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &data) {
-   v8::Local<v8::Object> object = data.GetValue();
-   SWIGV8_Proxy *proxy = data.GetParameter();
-+#else
-+  static void $jswrapper(const v8::WeakCallbackInfo<SWIGV8_Proxy> &data) {
-+  SWIGV8_Proxy *proxy = data.GetParameter();
- #endif
- 
-   if(proxy->swigCMemOwn && proxy->swigCObject) {
-@@ -147,7 +150,9 @@ static void $jswrapper(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &dat
-   }
-   delete proxy;
- 
-+#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-   object.Clear();
-+#endif
-   
- #if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031710)
-   object.Dispose();
-@@ -155,7 +160,7 @@ static void $jswrapper(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &dat
-   object.Dispose(isolate);
- #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x032100)
-   object->Dispose(isolate);
--#else
-+#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-   object->Dispose();
- #endif
- }
-@@ -177,10 +182,13 @@ static void $jswrapper(v8::Isolate *isolate, v8::Persistent<v8::Value> object, v
-   SWIGV8_Proxy *proxy = static_cast<SWIGV8_Proxy *>(parameter);
- #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
- static void $jswrapper(v8::Isolate *isolate, v8::Persistent< v8::Object> *object, SWIGV8_Proxy *proxy) {
--#else
-+#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
- static void $jswrapper(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &data) {
-   v8::Local<v8::Object> object = data.GetValue();
-   SWIGV8_Proxy *proxy = data.GetParameter();
-+#else
-+static void $jswrapper(const v8::WeakCallbackInfo<SWIGV8_Proxy> &data) {
-+  SWIGV8_Proxy *proxy = data.GetParameter();
- #endif
- 
-   if(proxy->swigCMemOwn && proxy->swigCObject) {
-@@ -197,7 +205,7 @@ static void $jswrapper(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &dat
-   object->Dispose(isolate);
- #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
-   object->Dispose();
--#else
-+#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-   object.Clear();
- #endif
- }
-@@ -211,7 +219,11 @@ static void $jswrapper(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &dat
-  * ----------------------------------------------------------------------------- */
- %fragment("js_getter", "templates")
- %{
-+#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
- static SwigV8ReturnValue $jswrapper(v8::Local<v8::String> property, const SwigV8PropertyCallbackInfo &info) {
-+#else
-+static SwigV8ReturnValue $jswrapper(v8::Local<v8::Name> property, const SwigV8PropertyCallbackInfo &info) {
-+#endif
-   SWIGV8_HANDLESCOPE();
-   
-   v8::Handle<v8::Value> jsresult;
-@@ -233,8 +245,11 @@ fail:
-  * ----------------------------------------------------------------------------- */
- %fragment("js_setter", "templates")
- %{
--static void $jswrapper(v8::Local<v8::String> property, v8::Local<v8::Value> value,
--  const SwigV8PropertyCallbackInfoVoid &info) {
-+#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-+static void $jswrapper(v8::Local<v8::String> property, v8::Local<v8::Value> value, const SwigV8PropertyCallbackInfoVoid &info) {
-+#else
-+static void $jswrapper(v8::Local<v8::Name> property, v8::Local<v8::Value> value, const SwigV8PropertyCallbackInfoVoid &info) {
-+#endif
-   SWIGV8_HANDLESCOPE();
-   
-   $jslocals
-diff --git a/Lib/javascript/v8/javascripthelpers.swg b/Lib/javascript/v8/javascripthelpers.swg
-index 091467d..7461079 100644
---- a/Lib/javascript/v8/javascripthelpers.swg
-+++ b/Lib/javascript/v8/javascripthelpers.swg
-@@ -6,11 +6,16 @@ typedef v8::InvocationCallback  SwigV8FunctionCallback;
- typedef v8::AccessorGetter      SwigV8AccessorGetterCallback;
- typedef v8::AccessorSetter      SwigV8AccessorSetterCallback;
- typedef v8::AccessorInfo        SwigV8PropertyCallbackInfoVoid;
--#else
-+#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
- typedef v8::FunctionCallback            SwigV8FunctionCallback;
- typedef v8::AccessorGetterCallback      SwigV8AccessorGetterCallback;
- typedef v8::AccessorSetterCallback      SwigV8AccessorSetterCallback;
- typedef v8::PropertyCallbackInfo<void>  SwigV8PropertyCallbackInfoVoid;
-+#else
-+typedef v8::FunctionCallback            SwigV8FunctionCallback;
-+typedef v8::AccessorNameGetterCallback  SwigV8AccessorGetterCallback;
-+typedef v8::AccessorNameSetterCallback  SwigV8AccessorSetterCallback;
-+typedef v8::PropertyCallbackInfo<void>  SwigV8PropertyCallbackInfoVoid;
- #endif
- 
- /**
-@@ -65,18 +70,36 @@ SWIGRUNTIME void SWIGV8_AddStaticFunction(v8::Handle<v8::Object> obj, const char
-  */
- SWIGRUNTIME void SWIGV8_AddStaticVariable(v8::Handle<v8::Object> obj, const char* symbol,
-   SwigV8AccessorGetterCallback getter, SwigV8AccessorSetterCallback setter) {
-+#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-   obj->SetAccessor(SWIGV8_SYMBOL_NEW(symbol), getter, setter);
-+#else
-+  obj->SetAccessor(SWIGV8_CURRENT_CONTEXT(), SWIGV8_SYMBOL_NEW(symbol), getter, setter);
-+#endif
- }
- 
--SWIGRUNTIME void JS_veto_set_variable(v8::Local<v8::String> property, v8::Local<v8::Value> value,
--  const SwigV8PropertyCallbackInfoVoid& info)
-+#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-+SWIGRUNTIME void JS_veto_set_variable(v8::Local<v8::String> property, v8::Local<v8::Value> value, const SwigV8PropertyCallbackInfoVoid& info)
-+#else
-+SWIGRUNTIME void JS_veto_set_variable(v8::Local<v8::Name> property, v8::Local<v8::Value> value, const SwigV8PropertyCallbackInfoVoid& info)
-+#endif
- {
-     char buffer[256];
-     char msg[512];
-     int res;
- 
-+#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-     property->WriteUtf8(buffer, 256);
-     res = sprintf(msg, "Tried to write read-only variable: %s.", buffer);
-+#else
-+    v8::Local<v8::String> sproperty;
-+    if (property->ToString(SWIGV8_CURRENT_CONTEXT()).ToLocal(&sproperty)) {
-+      sproperty->WriteUtf8(buffer, 256);
-+      res = sprintf(msg, "Tried to write read-only variable: %s.", buffer);
-+    }
-+    else {
-+      res = -1;
-+    }
-+#endif
- 
-     if(res<0) {
-       SWIG_exception(SWIG_ERROR, "Tried to write read-only variable.");
-diff --git a/Lib/javascript/v8/javascriptinit.swg b/Lib/javascript/v8/javascriptinit.swg
-index 34befa7..86008d9 100644
---- a/Lib/javascript/v8/javascriptinit.swg
-+++ b/Lib/javascript/v8/javascriptinit.swg
-@@ -7,15 +7,27 @@ SWIG_V8_SetModule(void *, swig_module_info *swig_module) {
-   v8::Local<v8::Object> global_obj = SWIGV8_CURRENT_CONTEXT()->Global();
-   v8::Local<v8::External> mod = SWIGV8_EXTERNAL_NEW(swig_module);
-   assert(!mod.IsEmpty());
-+#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-   global_obj->SetHiddenValue(SWIGV8_STRING_NEW("swig_module_info_data"), mod);
-+#else
-+  v8::Local<v8::Private> privateKey = v8::Private::ForApi(v8::Isolate::GetCurrent(), SWIGV8_STRING_NEW("swig_module_info_data"));
-+  global_obj->SetPrivate(SWIGV8_CURRENT_CONTEXT(), privateKey, mod);
-+#endif
- }
- 
- SWIGRUNTIME swig_module_info *
- SWIG_V8_GetModule(void *) {
-   v8::Local<v8::Object> global_obj = SWIGV8_CURRENT_CONTEXT()->Global();
-+#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-   v8::Local<v8::Value> moduleinfo = global_obj->GetHiddenValue(SWIGV8_STRING_NEW("swig_module_info_data"));
-+#else
-+  v8::Local<v8::Private> privateKey = v8::Private::ForApi(v8::Isolate::GetCurrent(), SWIGV8_STRING_NEW("swig_module_info_data"));
-+  v8::Local<v8::Value> moduleinfo;
-+  if (!global_obj->GetPrivate(SWIGV8_CURRENT_CONTEXT(), privateKey).ToLocal(&moduleinfo))
-+    return 0;
-+#endif
- 
--  if (moduleinfo.IsEmpty())
-+  if (moduleinfo.IsEmpty() || moduleinfo->IsNull() || moduleinfo->IsUndefined())
-   {
-     // It's not yet loaded
-     return 0;
-@@ -23,7 +35,7 @@ SWIG_V8_GetModule(void *) {
- 
-   v8::Local<v8::External> moduleinfo_extern = v8::Local<v8::External>::Cast(moduleinfo);
- 
--  if (moduleinfo_extern.IsEmpty())
-+  if (moduleinfo_extern.IsEmpty() || moduleinfo_extern->IsNull() || moduleinfo_extern->IsUndefined())
-   {
-     // Something's not right
-     return 0;
-diff --git a/Lib/javascript/v8/javascriptrun.swg b/Lib/javascript/v8/javascriptrun.swg
-index 5ac52a5..30002c0 100644
---- a/Lib/javascript/v8/javascriptrun.swg
-+++ b/Lib/javascript/v8/javascriptrun.swg
-@@ -193,8 +193,10 @@ public:
-   void (*dtor) (v8::Isolate *isolate, v8::Persistent< v8::Value> object, void *parameter);
- #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
-   void (*dtor) (v8::Isolate *isolate, v8::Persistent< v8::Object > *object, SWIGV8_Proxy *proxy);
--#else
-+#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-   void (*dtor) (const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &data);
-+#else
-+  void (*dtor) (const v8::WeakCallbackInfo<SWIGV8_Proxy> &data);
- #endif
- };
- 
-@@ -241,9 +243,12 @@ SWIGRUNTIME void SWIGV8_Proxy_DefaultDtor(v8::Isolate *, v8::Persistent< v8::Val
-   SWIGV8_Proxy *proxy = static_cast<SWIGV8_Proxy *>(parameter);
- #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
- SWIGRUNTIME void SWIGV8_Proxy_DefaultDtor(v8::Isolate *, v8::Persistent< v8::Object > *object, SWIGV8_Proxy *proxy) {
--#else
-+#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
- SWIGRUNTIME void SWIGV8_Proxy_DefaultDtor(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &data) {
-   SWIGV8_Proxy *proxy = data.GetParameter();
-+#else
-+SWIGRUNTIME void SWIGV8_Proxy_DefaultDtor(const v8::WeakCallbackInfo<SWIGV8_Proxy> &data) {
-+  SWIGV8_Proxy *proxy = data.GetParameter();
- #endif
- 
-   delete proxy;
-@@ -312,12 +317,18 @@ SWIGRUNTIME void SWIGV8_SetPrivateData(v8::Handle<v8::Object> obj, void *ptr, sw
-   } else {
-     cdata->handle.MakeWeak(cdata, SWIGV8_Proxy_DefaultDtor);
-   }
--#else
-+#elifif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-   if(cdata->swigCMemOwn && (SWIGV8_ClientData*)info->clientdata) {
-     cdata->handle.SetWeak(cdata, ((SWIGV8_ClientData*)info->clientdata)->dtor);
-   } else {
-     cdata->handle.SetWeak(cdata, SWIGV8_Proxy_DefaultDtor);
-   }
-+#else
-+  if(cdata->swigCMemOwn && (SWIGV8_ClientData*)info->clientdata) {
-+    cdata->handle.SetWeak(cdata, ((SWIGV8_ClientData*)info->clientdata)->dtor, v8::WeakCallbackType::kParameter);
-+  } else {
-+    cdata->handle.SetWeak(cdata, SWIGV8_Proxy_DefaultDtor, v8::WeakCallbackType::kParameter);
-+  }
- #endif
- 
- #if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031710)
-@@ -470,7 +481,14 @@ int SwigV8Packed_Check(v8::Handle<v8::Value> valRef) {
-   
-   v8::Handle<v8::Object> objRef = valRef->ToObject();
-   if(objRef->InternalFieldCount() < 1) return false;
-+#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-   v8::Handle<v8::Value> flag = objRef->GetHiddenValue(SWIGV8_STRING_NEW("__swig__packed_data__"));
-+#else
-+  v8::Local<v8::Private> privateKey = v8::Private::ForApi(v8::Isolate::GetCurrent(), SWIGV8_STRING_NEW("__swig__packed_data__"));
-+  v8::Local<v8::Value> flag;
-+  if (!objRef->GetPrivate(SWIGV8_CURRENT_CONTEXT(), privateKey).ToLocal(&flag))
-+    return false;
-+#endif
-   return (flag->IsBoolean() && flag->BooleanValue());
- }
- 
-@@ -519,10 +537,13 @@ SWIGRUNTIME void _wrap_SwigV8PackedData_delete(v8::Isolate *isolate, v8::Persist
-   SwigV8PackedData *cdata = static_cast<SwigV8PackedData *>(parameter);
- #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
- SWIGRUNTIME void _wrap_SwigV8PackedData_delete(v8::Isolate *isolate, v8::Persistent<v8::Object> *object, SwigV8PackedData *cdata) {
--#else
-+#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
- SWIGRUNTIME void _wrap_SwigV8PackedData_delete(const v8::WeakCallbackData<v8::Object, SwigV8PackedData> &data) {
-   v8::Local<v8::Object> object = data.GetValue();
-   SwigV8PackedData *cdata = data.GetParameter();
-+#else
-+SWIGRUNTIME void _wrap_SwigV8PackedData_delete(const v8::WeakCallbackInfo<SwigV8PackedData> &data) {
-+  SwigV8PackedData *cdata = data.GetParameter();
- #endif
- 
-   delete cdata;
-@@ -537,7 +558,7 @@ SWIGRUNTIME void _wrap_SwigV8PackedData_delete(const v8::WeakCallbackData<v8::Ob
-   object->Dispose(isolate);
- #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
-   object->Dispose();
--#else
-+#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-   object.Clear();
- #endif
- }
-@@ -550,7 +571,12 @@ v8::Handle<v8::Value> SWIGV8_NewPackedObj(void *data, size_t size, swig_type_inf
- //  v8::Handle<v8::Object> obj = SWIGV8_OBJECT_NEW();
-   v8::Local<v8::Object> obj = SWIGV8_OBJECT_NEW();
- 
-+#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-   obj->SetHiddenValue(SWIGV8_STRING_NEW("__swig__packed_data__"), SWIGV8_BOOLEAN_NEW(true));
-+#else
-+  v8::Local<v8::Private> privateKey = v8::Private::ForApi(v8::Isolate::GetCurrent(), SWIGV8_STRING_NEW("__swig__packed_data__"));
-+  obj->SetPrivate(SWIGV8_CURRENT_CONTEXT(), privateKey, SWIGV8_BOOLEAN_NEW(true));
-+#endif
- 
- #if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031511)
-   obj->SetPointerInInternalField(0, cdata);
-@@ -573,9 +599,11 @@ v8::Handle<v8::Value> SWIGV8_NewPackedObj(void *data, size_t size, swig_type_inf
-   cdata->handle.MakeWeak(v8::Isolate::GetCurrent(), cdata, _wrap_SwigV8PackedData_delete);
- #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
-   cdata->handle.MakeWeak(cdata, _wrap_SwigV8PackedData_delete);
--#else
-+#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
-   cdata->handle.SetWeak(cdata, _wrap_SwigV8PackedData_delete);
- //  v8::V8::SetWeak(&cdata->handle, cdata, _wrap_SwigV8PackedData_delete);
-+#else
-+  cdata->handle.SetWeak(cdata, _wrap_SwigV8PackedData_delete, v8::WeakCallbackType::kParameter);
- #endif
- 
- #if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031710)
--- 
-2.9.5
-
diff --git a/meta/recipes-devtools/swig/swig/0001-Fix-generated-code-for-constant-expressions-containi.patch b/meta/recipes-devtools/swig/swig/0001-Fix-generated-code-for-constant-expressions-containi.patch
deleted file mode 100644
index f4ed782a82..0000000000
--- a/meta/recipes-devtools/swig/swig/0001-Fix-generated-code-for-constant-expressions-containi.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-From 90ba174fcea1618af57aa594199541d47a89b7f6 Mon Sep 17 00:00:00 2001
-From: William S Fulton <wsf@fultondesigns.co.uk>
-Date: Sun, 17 Sep 2017 19:02:55 +0100
-Subject: [PATCH 1/2] Fix generated code for constant expressions containing
- wchar_t L literals.
-
-Such as:
-  # define __WCHAR_MAX    (0x7fffffff + L'\0')
-
-Reported on swig-user mailing list.
----
- CHANGES.current                                         | 5 +++++
- Examples/test-suite/csharp/preproc_constants_c_runme.cs | 3 ++-
- Examples/test-suite/csharp/preproc_constants_runme.cs   | 2 ++
- Examples/test-suite/d/preproc_constants_c_runme.1.d     | 2 ++
- Examples/test-suite/d/preproc_constants_c_runme.2.d     | 2 ++
- Examples/test-suite/d/preproc_constants_runme.1.d       | 2 ++
- Examples/test-suite/d/preproc_constants_runme.2.d       | 2 ++
- Examples/test-suite/php/preproc_constants_c_runme.php   | 2 ++
- Examples/test-suite/php/preproc_constants_runme.php     | 2 ++
- Examples/test-suite/php5/preproc_constants_c_runme.php  | 2 ++
- Examples/test-suite/php5/preproc_constants_runme.php    | 2 ++
- Examples/test-suite/preproc_constants.i                 | 3 +++
- Source/CParse/parser.y                                  | 2 +-
- 13 files changed, 29 insertions(+), 2 deletions(-)
-
-Upstream-Status: Backport
-[https://github.com/swig/swig/commit/90ba174fcea1618af57aa594199541d47a89b7f6]
-Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
-
-diff --git a/Examples/test-suite/csharp/preproc_constants_c_runme.cs b/Examples/test-suite/csharp/preproc_constants_c_runme.cs
-index 76c684d..1c28e49 100644
---- a/Examples/test-suite/csharp/preproc_constants_c_runme.cs
-+++ b/Examples/test-suite/csharp/preproc_constants_c_runme.cs
-@@ -61,7 +61,8 @@ public class runme {
-     assert( typeof(int) == preproc_constants_c.EXPR_LAND.GetType() );
-     assert( typeof(int) == preproc_constants_c.EXPR_LOR.GetType() );
-     assert( typeof(double) == preproc_constants_c.EXPR_CONDITIONAL.GetType() );
--
-+    assert( typeof(int) == preproc_constants_c.EXPR_WCHAR_MAX.GetType() );
-+    assert( typeof(int) == preproc_constants_c.EXPR_WCHAR_MIN.GetType() );
-   }
-   static void assert(bool assertion) {
-     if (!assertion)
-diff --git a/Examples/test-suite/csharp/preproc_constants_runme.cs b/Examples/test-suite/csharp/preproc_constants_runme.cs
-index 9fae591..6b02e30 100644
---- a/Examples/test-suite/csharp/preproc_constants_runme.cs
-+++ b/Examples/test-suite/csharp/preproc_constants_runme.cs
-@@ -60,6 +60,8 @@ public class runme {
-     assert( typeof(bool) == preproc_constants.EXPR_LAND.GetType() );
-     assert( typeof(bool) == preproc_constants.EXPR_LOR.GetType() );
-     assert( typeof(double) == preproc_constants.EXPR_CONDITIONAL.GetType() );
-+    assert( typeof(int) == preproc_constants.EXPR_WCHAR_MAX.GetType() );
-+    assert( typeof(int) == preproc_constants.EXPR_WCHAR_MIN.GetType() );
- 
-   }
-   static void assert(bool assertion) {
-diff --git a/Examples/test-suite/d/preproc_constants_c_runme.1.d b/Examples/test-suite/d/preproc_constants_c_runme.1.d
-index d846c71..2b349af 100644
---- a/Examples/test-suite/d/preproc_constants_c_runme.1.d
-+++ b/Examples/test-suite/d/preproc_constants_c_runme.1.d
-@@ -61,4 +61,6 @@ void main() {
-   static assert(is(int == typeof(EXPR_LAND())));
-   static assert(is(int == typeof(EXPR_LOR())));
-   static assert(is(double == typeof(EXPR_CONDITIONAL())));
-+  static assert(is(int == typeof(EXPR_WCHAR_MAX())));
-+  static assert(is(int == typeof(EXPR_WCHAR_MIN())));
- }
-diff --git a/Examples/test-suite/d/preproc_constants_c_runme.2.d b/Examples/test-suite/d/preproc_constants_c_runme.2.d
-index 9bdbb93..1bac525 100644
---- a/Examples/test-suite/d/preproc_constants_c_runme.2.d
-+++ b/Examples/test-suite/d/preproc_constants_c_runme.2.d
-@@ -61,4 +61,6 @@ void main() {
-   static assert(is(int == typeof(EXPR_LAND())));
-   static assert(is(int == typeof(EXPR_LOR())));
-   static assert(is(double == typeof(EXPR_CONDITIONAL())));
-+  static assert(is(int == typeof(EXPR_WCHAR_MAX())));
-+  static assert(is(int == typeof(EXPR_WCHAR_MIN())));
- }
-diff --git a/Examples/test-suite/d/preproc_constants_runme.1.d b/Examples/test-suite/d/preproc_constants_runme.1.d
-index 009405f..f743f48 100644
---- a/Examples/test-suite/d/preproc_constants_runme.1.d
-+++ b/Examples/test-suite/d/preproc_constants_runme.1.d
-@@ -60,4 +60,6 @@ void main() {
-   static assert(is(bool == typeof(EXPR_LAND())));
-   static assert(is(bool == typeof(EXPR_LOR())));
-   static assert(is(double == typeof(EXPR_CONDITIONAL())));
-+  static assert(is(int == typeof(EXPR_WCHAR_MAX())));
-+  static assert(is(int == typeof(EXPR_WCHAR_MIN())));
- }
-diff --git a/Examples/test-suite/d/preproc_constants_runme.2.d b/Examples/test-suite/d/preproc_constants_runme.2.d
-index 2d92ef0..0d96c37 100644
---- a/Examples/test-suite/d/preproc_constants_runme.2.d
-+++ b/Examples/test-suite/d/preproc_constants_runme.2.d
-@@ -60,4 +60,6 @@ void main() {
-   static assert(is(bool == typeof(EXPR_LAND())));
-   static assert(is(bool == typeof(EXPR_LOR())));
-   static assert(is(double == typeof(EXPR_CONDITIONAL())));
-+  static assert(is(int == typeof(EXPR_WCHAR_MAX())));
-+  static assert(is(int == typeof(EXPR_WCHAR_MIN())));
- }
-diff --git a/Examples/test-suite/php/preproc_constants_c_runme.php b/Examples/test-suite/php/preproc_constants_c_runme.php
-index af9b76e..e59fe18 100644
---- a/Examples/test-suite/php/preproc_constants_c_runme.php
-+++ b/Examples/test-suite/php/preproc_constants_c_runme.php
-@@ -62,5 +62,7 @@ check::equal(gettype(preproc_constants_c::EXPR_OR), "integer", "preproc_constant
- check::equal(gettype(preproc_constants_c::EXPR_LAND), "integer", "preproc_constants.EXPR_LAND has unexpected type");
- check::equal(gettype(preproc_constants_c::EXPR_LOR), "integer", "preproc_constants.EXPR_LOR has unexpected type");
- check::equal(gettype(preproc_constants_c::EXPR_CONDITIONAL), "double", "preproc_constants.EXPR_CONDITIONAL has unexpected type");
-+check::equal(gettype(preproc_constants_c::EXPR_WCHAR_MAX), "integer", "preproc_constants.EXPR_WCHAR_MAX has unexpected type");
-+check::equal(gettype(preproc_constants_c::EXPR_WCHAR_MIN), "integer", "preproc_constants.EXPR_WCHAR_MIN has unexpected type");
- 
- ?>
-diff --git a/Examples/test-suite/php/preproc_constants_runme.php b/Examples/test-suite/php/preproc_constants_runme.php
-index 5c9119b..8e117ea 100644
---- a/Examples/test-suite/php/preproc_constants_runme.php
-+++ b/Examples/test-suite/php/preproc_constants_runme.php
-@@ -61,5 +61,7 @@ check::equal(gettype(preproc_constants::EXPR_OR), "integer", "preproc_constants.
- check::equal(gettype(preproc_constants::EXPR_LAND), "boolean", "preproc_constants.EXPR_LAND has unexpected type");
- check::equal(gettype(preproc_constants::EXPR_LOR), "boolean", "preproc_constants.EXPR_LOR has unexpected type");
- check::equal(gettype(preproc_constants::EXPR_CONDITIONAL), "double", "preproc_constants.EXPR_CONDITIONAL has unexpected type");
-+check::equal(gettype(preproc_constants::EXPR_WCHAR_MAX), "integer", "preproc_constants.EXPR_WCHAR_MAX has unexpected type");
-+check::equal(gettype(preproc_constants::EXPR_WCHAR_MIN), "integer", "preproc_constants.EXPR_WCHAR_MIN has unexpected type");
- 
- ?>
-diff --git a/Examples/test-suite/php5/preproc_constants_c_runme.php b/Examples/test-suite/php5/preproc_constants_c_runme.php
-index 1ea0195..d978fab 100644
---- a/Examples/test-suite/php5/preproc_constants_c_runme.php
-+++ b/Examples/test-suite/php5/preproc_constants_c_runme.php
-@@ -62,5 +62,7 @@ check::equal(gettype(preproc_constants_c::EXPR_OR), "integer", "preproc_constant
- check::equal(gettype(preproc_constants_c::EXPR_LAND), "integer", "preproc_constants.EXPR_LAND has unexpected type");
- check::equal(gettype(preproc_constants_c::EXPR_LOR), "integer", "preproc_constants.EXPR_LOR has unexpected type");
- check::equal(gettype(preproc_constants_c::EXPR_CONDITIONAL), "double", "preproc_constants.EXPR_CONDITIONAL has unexpected type");
-+check::equal(gettype(preproc_constants_c::EXPR_WCHAR_MAX), "integer", "preproc_constants.EXPR_WCHAR_MAX has unexpected type");
-+check::equal(gettype(preproc_constants_c::EXPR_WCHAR_MIN), "integer", "preproc_constants.EXPR_WCHAR_MIN has unexpected type");
- 
- ?>
-diff --git a/Examples/test-suite/php5/preproc_constants_runme.php b/Examples/test-suite/php5/preproc_constants_runme.php
-index fb9ee4f..7527026 100644
---- a/Examples/test-suite/php5/preproc_constants_runme.php
-+++ b/Examples/test-suite/php5/preproc_constants_runme.php
-@@ -70,5 +70,7 @@ check::equal(gettype(preproc_constants::EXPR_LAND), "integer", "preproc_constant
- check::equal(gettype(preproc_constants::EXPR_LOR), "integer", "preproc_constants.EXPR_LOR has unexpected type");
- 
- check::equal(gettype(preproc_constants::EXPR_CONDITIONAL), "double", "preproc_constants.EXPR_CONDITIONAL has unexpected type");
-+check::equal(gettype(preproc_constants::EXPR_WCHAR_MAX), "integer", "preproc_constants.EXPR_WCHAR_MAX has unexpected type");
-+check::equal(gettype(preproc_constants::EXPR_WCHAR_MIN), "integer", "preproc_constants.EXPR_WCHAR_MIN has unexpected type");
- 
- ?>
-diff --git a/Examples/test-suite/preproc_constants.i b/Examples/test-suite/preproc_constants.i
-index 3a999ad..16b44c9 100644
---- a/Examples/test-suite/preproc_constants.i
-+++ b/Examples/test-suite/preproc_constants.i
-@@ -87,6 +87,9 @@
- #define EXPR_LOR         0xFF || 1
- #define EXPR_CONDITIONAL true ? 2 : 2.2
- 
-+#define EXPR_WCHAR_MAX   (0x7fffffff + L'\0')
-+#define EXPR_WCHAR_MIN   (-EXPR_WCHAR_MAX - 1)
-+
- #define EXPR_CHAR_COMPOUND_ADD 'A' + 12
- #define EXPR_CHAR_COMPOUND_LSHIFT 'B' << 6
- #define H_SUPPRESS_SCALING_MAGIC (('s'<<24) | ('u'<<16) | ('p'<<8) | 'p')
-diff --git a/Source/CParse/parser.y b/Source/CParse/parser.y
-index 2e92cd0..273dadb 100644
---- a/Source/CParse/parser.y
-+++ b/Source/CParse/parser.y
-@@ -194,7 +194,7 @@ int SWIG_cparse_template_reduce(int treduce) {
-  * ----------------------------------------------------------------------------- */
- 
- static int promote_type(int t) {
--  if (t <= T_UCHAR || t == T_CHAR) return T_INT;
-+  if (t <= T_UCHAR || t == T_CHAR || t == T_WCHAR) return T_INT;
-   return t;
- }
- 
--- 
-2.9.5
-
diff --git a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
index 81df3e264f..f27f80ea18 100644
--- a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
+++ b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
@@ -13,13 +13,11 @@ http://sourceforge.net/mailarchive/message.php?msg_id=29179733
  Source/Modules/main.cxx |   24 ++++++++++++++++++++++--
  1 file changed, 22 insertions(+), 2 deletions(-)
 
-diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
-index d2f5d3b..cbb0a12 100644
 --- a/Source/Modules/main.cxx
 +++ b/Source/Modules/main.cxx
-@@ -26,6 +26,11 @@ char cvsroot_main_cxx[] = "$Id$";
- #include "cparse.h"
+@@ -25,6 +25,11 @@
  #include <ctype.h>
+ #include <errno.h>
  #include <limits.h>		// for INT_MAX
 +#ifndef _WIN32
 +#include <cstddef>
@@ -29,7 +27,7 @@ index d2f5d3b..cbb0a12 100644
  
  // Global variables
  
-@@ -902,9 +907,9 @@ int SWIG_main(int argc, char *argv[], Language *l) {
+@@ -934,9 +939,9 @@ int SWIG_main(int argc, char *argv[], co
  
    // Check for SWIG_LIB environment variable
    if ((c = getenv("SWIG_LIB")) == (char *) 0) {
@@ -40,7 +38,7 @@ index d2f5d3b..cbb0a12 100644
      if (!(GetModuleFileName(0, buf, MAX_PATH) == 0 || (p = strrchr(buf, '\\')) == 0)) {
        *(p + 1) = '\0';
        SwigLib = NewStringf("%sLib", buf); // Native windows installation path
-@@ -914,7 +919,22 @@ int SWIG_main(int argc, char *argv[], Language *l) {
+@@ -946,7 +951,22 @@ int SWIG_main(int argc, char *argv[], co
      if (Len(SWIG_LIB_WIN_UNIX) > 0)
        SwigLibWinUnix = NewString(SWIG_LIB_WIN_UNIX); // Unix installation path using a drive letter (for msys/mingw)
  #else
@@ -64,6 +62,3 @@ index d2f5d3b..cbb0a12 100644
  #endif
    } else {
      SwigLib = NewString(c);
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
index 1b1128acab..114de7ed94 100644
--- a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
+++ b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
@@ -9,11 +9,9 @@ Upstream-Status: pending
  configure.ac | 38 +++++++-------------------------------
  1 file changed, 7 insertions(+), 31 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 0c984b7..6edcec1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -70,38 +70,14 @@ AC_MSG_RESULT([$with_pcre])
+@@ -52,38 +52,14 @@ AC_MSG_RESULT([$with_pcre])
  
  dnl To make configuring easier, check for a locally built PCRE using the Tools/pcre-build.sh script
  if test x"${with_pcre}" = xyes ; then
@@ -59,6 +57,3 @@ index 0c984b7..6edcec1 100644
  
  
  dnl CCache
--- 
-1.9.3
-
diff --git a/meta/recipes-devtools/swig/swig/Python-Fix-new-GCC8-warnings-in-generated-code.patch b/meta/recipes-devtools/swig/swig/Python-Fix-new-GCC8-warnings-in-generated-code.patch
deleted file mode 100644
index a91385916c..0000000000
--- a/meta/recipes-devtools/swig/swig/Python-Fix-new-GCC8-warnings-in-generated-code.patch
+++ /dev/null
@@ -1,191 +0,0 @@
-From b6c0ef4b8f6e5c089ac7104b3aaba8f1d17b8b82 Mon Sep 17 00:00:00 2001
-From: Olly Betts <olly@survex.com>
-Date: Mon, 11 Jun 2018 15:51:53 +1200
-Subject: [PATCH] [Python] Fix new GCC8 warnings in generated code
-
-Avoid casts between incompatible function types where possible (when
-keyword args are in use, it is not possible to avoid such warnings as
-they are inherent in the design of Python's C API in that particular
-case).  Fixes #1259.
-
-Upstream-Status: Backport
-[https://github.com/swig/swig/commit/7f9883011029674553a2a4b623d459f02b512458]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- Lib/python/pyinit.swg     |  4 ++--
- Lib/python/pyrun.swg      | 34 ++++++++++++++++++++++++++--------
- Source/Modules/python.cxx | 26 +++++++++++++-------------
- 3 files changed, 41 insertions(+), 23 deletions(-)
-
-diff --git a/Lib/python/pyinit.swg b/Lib/python/pyinit.swg
-index 2cc5828..6bf68c1 100644
---- a/Lib/python/pyinit.swg
-+++ b/Lib/python/pyinit.swg
-@@ -368,8 +368,8 @@ SWIG_init(void) {
-     (char *)"this", &SwigPyBuiltin_ThisClosure, NULL, NULL, NULL
-   };
-   static SwigPyGetSet thisown_getset_closure = {
--    (PyCFunction) SwigPyObject_own,
--    (PyCFunction) SwigPyObject_own
-+    SwigPyObject_own,
-+    SwigPyObject_own
-   };
-   static PyGetSetDef thisown_getset_def = {
-     (char *)"thisown", SwigPyBuiltin_GetterClosure, SwigPyBuiltin_SetterClosure, NULL, &thisown_getset_closure
-diff --git a/Lib/python/pyrun.swg b/Lib/python/pyrun.swg
-index ab1237f..3d0b1b3 100644
---- a/Lib/python/pyrun.swg
-+++ b/Lib/python/pyrun.swg
-@@ -465,6 +465,14 @@ SwigPyObject_repr(SwigPyObject *v, PyObject *args)
-   return repr;  
- }
- 
-+/* We need a version taking two PyObject* parameters so it's a valid
-+ * PyCFunction to use in swigobject_methods[]. */
-+SWIGRUNTIME PyObject *
-+SwigPyObject_repr2(PyObject *v, PyObject *SWIGUNUSEDPARM(args))
-+{
-+  return SwigPyObject_repr((SwigPyObject*)v);
-+}
-+
- SWIGRUNTIME int
- SwigPyObject_compare(SwigPyObject *v, SwigPyObject *w)
- {
-@@ -594,11 +602,7 @@ SwigPyObject_append(PyObject* v, PyObject* next)
- }
- 
- SWIGRUNTIME PyObject* 
--#ifdef METH_NOARGS
--SwigPyObject_next(PyObject* v)
--#else
- SwigPyObject_next(PyObject* v, PyObject *SWIGUNUSEDPARM(args))
--#endif
- {
-   SwigPyObject *sobj = (SwigPyObject *) v;
-   if (sobj->next) {    
-@@ -633,6 +637,20 @@ SwigPyObject_acquire(PyObject* v, PyObject *SWIGUNUSEDPARM(args))
-   return SWIG_Py_Void();
- }
- 
-+#ifdef METH_NOARGS
-+static PyObject*
-+SwigPyObject_disown2(PyObject* v, PyObject *SWIGUNUSEDPARM(args))
-+{
-+  return SwigPyObject_disown(v);
-+}
-+
-+static PyObject*
-+SwigPyObject_acquire2(PyObject* v, PyObject *SWIGUNUSEDPARM(args))
-+{
-+  return SwigPyObject_acquire(v);
-+}
-+#endif
-+
- SWIGINTERN PyObject*
- SwigPyObject_own(PyObject *v, PyObject *args)
- {
-@@ -673,12 +691,12 @@ SwigPyObject_own(PyObject *v, PyObject *args)
- #ifdef METH_O
- static PyMethodDef
- swigobject_methods[] = {
--  {(char *)"disown",  (PyCFunction)SwigPyObject_disown,  METH_NOARGS,  (char *)"releases ownership of the pointer"},
--  {(char *)"acquire", (PyCFunction)SwigPyObject_acquire, METH_NOARGS,  (char *)"acquires ownership of the pointer"},
-+  {(char *)"disown",  (PyCFunction)SwigPyObject_disown2, METH_NOARGS,  (char *)"releases ownership of the pointer"},
-+  {(char *)"acquire", (PyCFunction)SwigPyObject_acquire2,METH_NOARGS,  (char *)"acquires ownership of the pointer"},
-   {(char *)"own",     (PyCFunction)SwigPyObject_own,     METH_VARARGS, (char *)"returns/sets ownership of the pointer"},
-   {(char *)"append",  (PyCFunction)SwigPyObject_append,  METH_O,       (char *)"appends another 'this' object"},
-   {(char *)"next",    (PyCFunction)SwigPyObject_next,    METH_NOARGS,  (char *)"returns the next 'this' object"},
--  {(char *)"__repr__",(PyCFunction)SwigPyObject_repr,    METH_NOARGS,  (char *)"returns object representation"},
-+  {(char *)"__repr__",(PyCFunction)SwigPyObject_repr2,   METH_NOARGS,  (char *)"returns object representation"},
-   {0, 0, 0, 0}  
- };
- #else
-@@ -689,7 +707,7 @@ swigobject_methods[] = {
-   {(char *)"own",     (PyCFunction)SwigPyObject_own,     METH_VARARGS,  (char *)"returns/sets ownership of the pointer"},
-   {(char *)"append",  (PyCFunction)SwigPyObject_append,  METH_VARARGS,  (char *)"appends another 'this' object"},
-   {(char *)"next",    (PyCFunction)SwigPyObject_next,    METH_VARARGS,  (char *)"returns the next 'this' object"},
--  {(char *)"__repr__",(PyCFunction)SwigPyObject_repr,   METH_VARARGS,  (char *)"returns object representation"},
-+  {(char *)"__repr__",(PyCFunction)SwigPyObject_repr,    METH_VARARGS,  (char *)"returns object representation"},
-   {0, 0, 0, 0}  
- };
- #endif
-diff --git a/Source/Modules/python.cxx b/Source/Modules/python.cxx
-index a6801fc..72eaa77 100644
---- a/Source/Modules/python.cxx
-+++ b/Source/Modules/python.cxx
-@@ -1109,7 +1109,7 @@ public:
-    * ------------------------------------------------------------ */
-   int add_pyinstancemethod_new() {
-     String *name = NewString("SWIG_PyInstanceMethod_New");
--    Printf(methods, "\t { (char *)\"%s\", (PyCFunction)%s, METH_O, NULL},\n", name, name);
-+    Printf(methods, "\t { \"%s\", %s, METH_O, NULL},\n", name, name);
-     Delete(name);
-     return 0;
-   }
-@@ -2479,17 +2479,17 @@ public:
-     if (!kw) {
-       if (n && funpack) {
- 	if (num_required == 0 && num_arguments == 0) {
--	  Printf(methods, "\t { (char *)\"%s\", (PyCFunction)%s, METH_NOARGS, ", name, function);
-+	  Printf(methods, "\t { \"%s\", %s, METH_NOARGS, ", name, function);
- 	} else if (num_required == 1 && num_arguments == 1) {
--	  Printf(methods, "\t { (char *)\"%s\", (PyCFunction)%s, METH_O, ", name, function);
-+	  Printf(methods, "\t { \"%s\", %s, METH_O, ", name, function);
- 	} else {
--	  Printf(methods, "\t { (char *)\"%s\", %s, METH_VARARGS, ", name, function);
-+	  Printf(methods, "\t { \"%s\", %s, METH_VARARGS, ", name, function);
- 	}
-       } else {
--	Printf(methods, "\t { (char *)\"%s\", %s, METH_VARARGS, ", name, function);
-+	Printf(methods, "\t { \"%s\", %s, METH_VARARGS, ", name, function);
-       }
-     } else {
--      Printf(methods, "\t { (char *)\"%s\", (PyCFunction) %s, METH_VARARGS | METH_KEYWORDS, ", name, function);
-+      Printf(methods, "\t { \"%s\", (PyCFunction)%s, METH_VARARGS|METH_KEYWORDS, ", name, function);
-     }
- 
-     if (!n) {
-@@ -3857,7 +3857,7 @@ public:
-     if (shadow) {
-       if (builtin) {
- 	String *rname = SwigType_namestr(real_classname);
--	Printf(builtin_methods, "  { \"__disown__\", (PyCFunction) Swig::Director::swig_pyobj_disown< %s >, METH_NOARGS, \"\" },\n", rname);
-+	Printf(builtin_methods, "  { \"__disown__\", Swig::Director::swig_pyobj_disown< %s >, METH_NOARGS, \"\" },\n", rname);
- 	Delete(rname);
-       } else {
- 	String *symname = Getattr(n, "sym:name");
-@@ -4694,13 +4694,13 @@ public:
- 	int argcount = Getattr(n, "python:argcount") ? atoi(Char(Getattr(n, "python:argcount"))) : 2;
- 	String *ds = have_docstring(n) ? cdocstring(n, AUTODOC_FUNC) : NewString("");
- 	if (check_kwargs(n)) {
--	  Printf(builtin_methods, "  { \"%s\", (PyCFunction) %s, METH_VARARGS|METH_KEYWORDS, (char *) \"%s\" },\n", symname, wname, ds);
-+	  Printf(builtin_methods, "  { \"%s\", (PyCFunction)%s, METH_VARARGS|METH_KEYWORDS, \"%s\" },\n", symname, wname, ds);
- 	} else if (argcount == 0) {
--	  Printf(builtin_methods, "  { \"%s\", (PyCFunction) %s, METH_NOARGS, (char *) \"%s\" },\n", symname, wname, ds);
-+	  Printf(builtin_methods, "  { \"%s\", %s, METH_NOARGS, \"%s\" },\n", symname, wname, ds);
- 	} else if (argcount == 1) {
--	  Printf(builtin_methods, "  { \"%s\", (PyCFunction) %s, METH_O, (char *) \"%s\" },\n", symname, wname, ds);
-+	  Printf(builtin_methods, "  { \"%s\", %s, METH_O, \"%s\" },\n", symname, wname, ds);
- 	} else {
--	  Printf(builtin_methods, "  { \"%s\", (PyCFunction) %s, METH_VARARGS, (char *) \"%s\" },\n", symname, wname, ds);
-+	  Printf(builtin_methods, "  { \"%s\", %s, METH_VARARGS, \"%s\" },\n", symname, wname, ds);
- 	}
- 	Delete(fullname);
- 	Delete(wname);
-@@ -4801,10 +4801,10 @@ public:
- 	  Append(pyflags, "METH_VARARGS");
- 	if (have_docstring(n)) {
- 	  String *ds = cdocstring(n, AUTODOC_STATICFUNC);
--	  Printf(builtin_methods, "  { \"%s\", (PyCFunction) %s, %s, (char *) \"%s\" },\n", symname, wname, pyflags, ds);
-+	  Printf(builtin_methods, "  { \"%s\", (PyCFunction)%s, %s, \"%s\" },\n", symname, wname, pyflags, ds);
- 	  Delete(ds);
- 	} else {
--	  Printf(builtin_methods, "  { \"%s\", (PyCFunction) %s, %s, \"\" },\n", symname, wname, pyflags);
-+	  Printf(builtin_methods, "  { \"%s\", (PyCFunction)%s, %s, \"\" },\n", symname, wname, pyflags);
- 	}
- 	Delete(fullname);
- 	Delete(wname);
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
index 8ffb4bce8e..84c399182a 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -5,11 +5,9 @@ Upstream-Status: Inappropriate [OE reproducibiity fix upstream unlikely to take]
 RP 2021/3/1
 
 
-Index: swig-3.0.12/Source/Modules/main.cxx
-===================================================================
---- swig-3.0.12.orig/Source/Modules/main.cxx
-+++ swig-3.0.12/Source/Modules/main.cxx
-@@ -636,7 +636,6 @@ void SWIG_getoptions(int argc, char *arg
+--- a/Source/Modules/main.cxx
++++ b/Source/Modules/main.cxx
+@@ -642,7 +642,6 @@ static void getoptions(int argc, char *a
  	}
        } else if (strcmp(argv[i], "-version") == 0) {
  	fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
diff --git a/meta/recipes-devtools/swig/swig/swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch b/meta/recipes-devtools/swig/swig/swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch
deleted file mode 100644
index 10e4afd1ba..0000000000
--- a/meta/recipes-devtools/swig/swig/swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9825fcbab5c4ddd867432f9922bebfbec7b78af0 Mon Sep 17 00:00:00 2001
-From: Mark Dufour <m.dufour@kopano.com>
-Date: Tue, 14 Feb 2017 10:34:37 +0100
-Subject: [PATCH] [Coverity] fix issue reported for SWIG_Python_FixMethods
-
-Fix Coverity issue reported for SWIG_Python_FixMethods:
-
-"buffer_size: Calling strncpy with a source string whose length
-(10 chars) is greater than or equal to the size argument (10)
-will fail to null-terminate buff."
-
-The issue is only reported for the "swig_ptr: " line, but for
-consistency we replace both occurrences of strncpy with memcpy.
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://github.com/swig/swig/pull/898]
-
- Lib/python/pyinit.swg | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: swig-3.0.12/Lib/python/pyinit.swg
-===================================================================
---- swig-3.0.12.orig/Lib/python/pyinit.swg
-+++ swig-3.0.12/Lib/python/pyinit.swg
-@@ -306,9 +306,9 @@ SWIG_Python_FixMethods(PyMethodDef *meth
- 	  char *ndoc = (char*)malloc(ldoc + lptr + 10);
- 	  if (ndoc) {
- 	    char *buff = ndoc;
--	    strncpy(buff, methods[i].ml_doc, ldoc);
-+	    memcpy(buff, methods[i].ml_doc, ldoc);
- 	    buff += ldoc;
--	    strncpy(buff, "swig_ptr: ", 10);
-+	    memcpy(buff, "swig_ptr: ", 10);
- 	    buff += 10;
- 	    SWIG_PackVoidPtr(buff, ptr, ty->name, lptr);
- 	    methods[i].ml_doc = ndoc;
diff --git a/meta/recipes-devtools/swig/swig_3.0.12.bb b/meta/recipes-devtools/swig/swig_3.0.12.bb
deleted file mode 100644
index 090aaa8112..0000000000
--- a/meta/recipes-devtools/swig/swig_3.0.12.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
-            file://0001-configure-use-pkg-config-for-pcre-detection.patch \
-            file://0001-Add-Node-7.x-aka-V8-5.2-support.patch \
-            file://swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch \
-            file://Python-Fix-new-GCC8-warnings-in-generated-code.patch \
-            file://0001-Fix-generated-code-for-constant-expressions-containi.patch \
-            file://determinism.patch \
-           "
-SRC_URI[md5sum] = "82133dfa7bba75ff9ad98a7046be687c"
-SRC_URI[sha256sum] = "7cf9f447ae7ed1c51722efc45e7f14418d15d7a1e143ac9f09a668999f4fc94d"
-
diff --git a/meta/recipes-devtools/swig/swig_4.0.2.bb b/meta/recipes-devtools/swig/swig_4.0.2.bb
new file mode 100644
index 0000000000..718ad89a5d
--- /dev/null
+++ b/meta/recipes-devtools/swig/swig_4.0.2.bb
@@ -0,0 +1,7 @@
+require ${BPN}.inc
+
+SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
+            file://0001-configure-use-pkg-config-for-pcre-detection.patch \
+            file://determinism.patch \
+           "
+SRC_URI[sha256sum] = "d53be9730d8d58a16bf0cbd1f8ac0c0c3e1090573168bfa151b01eb47fa906fc"
-- 
2.31.1

