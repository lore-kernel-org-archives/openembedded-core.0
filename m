Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 08339731D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 17:41:09 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id e65so66351766pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 09:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=4Wr0ictSOcQQ4vLzXNo82UIZ63yzuCWX+ss1pZBB9YA=;
	b=Hwq3yY1qXAU09+D++sfsmfwRbkYSQOiah66mzIPS64Sd2nH06sHtZR19ok1vCki7H0
	4yzdX9gv7xrqtSWfAV94j2eQP76AtQvnI0JCsYbnCZTZ5NEspRhlG4Af8MRTdUi8RE4B
	i3XaNA0CMaOfeOllsoILeP500LtOJeSv8DG3VZ9UagcGAfQ+LYXLFZqSMS2fsSOt6USU
	hC1LBKMxROtJwbCZqHsXZQ/DT64SphU+foSMAgRyHfTly5lgbY7q23B4B+qtfMpo5mYK
	Nr0SMXLhw97dxiTieljHP66+zCnm6N2JbRjndSQ7CSKOE47P4h9wEGUtkzP4k9DwV2Az
	IWCA==
X-Received: by 10.98.72.156 with SMTP id q28mr35951663pfi.161.1452620470193;
	Tue, 12 Jan 2016 09:41:10 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:4dd9:ed7e:92c:d841?
	([2601:202:4000:1239:4dd9:ed7e:92c:d841])
	by smtp.googlemail.com with ESMTPSA id
	cq4sm78537842pad.28.2016.01.12.09.41.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jan 2016 09:41:09 -0800 (PST)
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
	<56947518.6090207@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56953AB3.2020703@gmail.com>
Date: Tue, 12 Jan 2016 09:41:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56947518.6090207@windriver.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH][V2][Jethro, fido 01/10] libxml2: security fix CVE-2015-7941
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
X-List-Received-Date: Tue, 12 Jan 2016 17:41:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 01/11/2016 07:38 PM, Robert Yang wrote:
> 
> Hi Armin,
> 
> 
> I got strange errors when apply the patches:
> 
> $ git am /tmp/jethro/*libxml2*
> [snip]
> Applying: libxml2: security fix CVE-2015-7500
> /buildarea/lyang1/poky/.git/rebase-apply/patch:80: trailing whitespace.
> 
> /buildarea/lyang1/poky/.git/rebase-apply/patch:82: space before tab in
> indent.
>            ((RAW != '/') || (NXT(1) != '>')) &&
> /buildarea/lyang1/poky/.git/rebase-apply/patch:84: trailing whitespace.
> 
> /buildarea/lyang1/poky/.git/rebase-apply/patch:85: space before tab in
> indent.
>         attname = xmlParseAttribute2(ctxt, prefix, localname,
> /buildarea/lyang1/poky/.git/rebase-apply/patch:86: space before tab in
> indent.
>                                      &aprefix, &attvalue, &len, &alloc);
> fatal: corrupt patch at line 300
> Patch failed at 0008 libxml2: security fix CVE-2015-7500
> 
> Would you please put the patches to a repo ? so that I can fetch them ?

sure thing.

armin
> 
> // Robert
> 
> On 01/08/2016 08:48 AM, Armin Kuster wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> includes:
>> CVE-2015-7941-1
>> CVE-2015-7941-2
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   meta/recipes-core/libxml/libxml2.inc               |  2 +
>>   ...top-parsing-on-entities-boundaries-errors.patch | 39 +++++++++++++++
>>   ...leanup-conditional-section-error-handling.patch | 56
>> ++++++++++++++++++++++
>>   3 files changed, 97 insertions(+)
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch
>>
>>
>> diff --git a/meta/recipes-core/libxml/libxml2.inc
>> b/meta/recipes-core/libxml/libxml2.inc
>> index 1c3c37d..24b98a6 100644
>> --- a/meta/recipes-core/libxml/libxml2.inc
>> +++ b/meta/recipes-core/libxml/libxml2.inc
>> @@ -21,6 +21,8 @@ SRC_URI =
>> "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
>>              file://libxml-m4-use-pkgconfig.patch \
>>              file://configure.ac-fix-cross-compiling-warning.patch \
>>             
>> file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
>> +          
>> file://CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch \
>> +          
>> file://CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch \
>>             "
>>
>>   BINCONFIG = "${bindir}/xml2-config"
>> diff --git
>> a/meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
>> b/meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
>>
>> new file mode 100644
>> index 0000000..11da9f9
>> --- /dev/null
>> +++
>> b/meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
>>
>> @@ -0,0 +1,39 @@
>> +From a7dfab7411cbf545f359dd3157e5df1eb0e7ce31 Mon Sep 17 00:00:00 2001
>> +From: Daniel Veillard <veillard@redhat.com>
>> +Date: Mon, 23 Feb 2015 11:17:35 +0800
>> +Subject: [PATCH] Stop parsing on entities boundaries errors
>> +
>> +For https://bugzilla.gnome.org/show_bug.cgi?id=744980
>> +
>> +There are times, like on unterminated entities that it's preferable to
>> +stop parsing, even if that means less error reporting. Entities are
>> +feeding the parser on further processing, and if they are ill defined
>> +then it's possible to get the parser to bug. Also do the same on
>> +Conditional Sections if the input is broken, as the structure of
>> +the document can't be guessed.
>> +
>> +Upstream-Status: Backport
>> +
>> +CVE-2015-7941-1
>> +
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + parser.c | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/parser.c b/parser.c
>> +index a8d1b67..bbe97eb 100644
>> +--- a/parser.c
>> ++++ b/parser.c
>> +@@ -5658,6 +5658,7 @@ xmlParseEntityDecl(xmlParserCtxtPtr ctxt) {
>> +     if (RAW != '>') {
>> +         xmlFatalErrMsgStr(ctxt, XML_ERR_ENTITY_NOT_FINISHED,
>> +                 "xmlParseEntityDecl: entity %s not terminated\n",
>> name);
>> ++        xmlStopParser(ctxt);
>> +     } else {
>> +         if (input != ctxt->input) {
>> +         xmlFatalErrMsg(ctxt, XML_ERR_ENTITY_BOUNDARY,
>> +--
>> +2.3.5
>> +
>> diff --git
>> a/meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch
>> b/meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch
>>
>> new file mode 100644
>> index 0000000..b7bd960
>> --- /dev/null
>> +++
>> b/meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch
>>
>> @@ -0,0 +1,56 @@
>> +From 9b8512337d14c8ddf662fcb98b0135f225a1c489 Mon Sep 17 00:00:00 2001
>> +From: Daniel Veillard <veillard@redhat.com>
>> +Date: Mon, 23 Feb 2015 11:29:20 +0800
>> +Subject: [PATCH] Cleanup conditional section error handling
>> +
>> +For https://bugzilla.gnome.org/show_bug.cgi?id=744980
>> +
>> +The error handling of Conditional Section also need to be
>> +straightened as the structure of the document can't be
>> +guessed on a failure there and it's better to stop parsing
>> +as further errors are likely to be irrelevant.
>> +
>> +Upstream-Status: Backport
>> +
>> +CVE-2015-7941-2
>> +
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + parser.c | 6 ++++++
>> + 1 file changed, 6 insertions(+)
>> +
>> +diff --git a/parser.c b/parser.c
>> +index bbe97eb..fe603ac 100644
>> +--- a/parser.c
>> ++++ b/parser.c
>> +@@ -6770,6 +6770,8 @@ xmlParseConditionalSections(xmlParserCtxtPtr
>> ctxt) {
>> +     SKIP_BLANKS;
>> +     if (RAW != '[') {
>> +         xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
>> ++        xmlStopParser(ctxt);
>> ++        return;
>> +     } else {
>> +         if (ctxt->input->id != id) {
>> +         xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
>> +@@ -6830,6 +6832,8 @@ xmlParseConditionalSections(xmlParserCtxtPtr
>> ctxt) {
>> +     SKIP_BLANKS;
>> +     if (RAW != '[') {
>> +         xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
>> ++        xmlStopParser(ctxt);
>> ++        return;
>> +     } else {
>> +         if (ctxt->input->id != id) {
>> +         xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
>> +@@ -6885,6 +6889,8 @@ xmlParseConditionalSections(xmlParserCtxtPtr
>> ctxt) {
>> +
>> +     } else {
>> +     xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID_KEYWORD, NULL);
>> ++    xmlStopParser(ctxt);
>> ++    return;
>> +     }
>> +
>> +     if (RAW == 0)
>> +--
>> +2.3.5
>> +
>>

