Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id CEE9B72384
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 15:31:59 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id eu11so5171912pac.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 07:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=/q/KKtB/IqEZmcm5RymEij3h7o8t1BX1O5CFK6Cf3Tc=;
	b=DLzbfrskZWkbJzMJpi9/R5Oz8DLuc9R4e/IftQLj1pzCXlp6l2Ow2TsFwOh8INb6qj
	bvxh3S/e4MjTY/U7fOyiizN9DpFKbGBWj5KcCcR+yCdhnp77pPk6Q1dO+tXEd7JeUEh8
	ojCU4Xo4A8ZQdKBg05//Qeko13dvVslecaG7d0X9afesqeXKsh7Rkk0PRKe+w2iNpE3y
	F10d6wG55eFWMrLRbRzTdGpCX0W2U9veVBCWzZsF00CSUTwjxYyY+R3ezBN2c7NA3NmF
	0iTW35KuEhsAeSuf1bYEVN9lwLX4XqfA7ThOq//Y0mzpZuaPdpdO8yeck9QkGRy1VUYl
	7Uww==
X-Received: by 10.70.35.104 with SMTP id g8mr31104300pdj.122.1417102319830;
	Thu, 27 Nov 2014 07:31:59 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:8821:701f:7551:6d07?
	([2601:c:9380:601:8821:701f:7551:6d07])
	by mx.google.com with ESMTPSA id je4sm7373097pbd.94.2014.11.27.07.31.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Nov 2014 07:31:58 -0800 (PST)
Message-ID: <547743EB.8000708@gmail.com>
Date: Thu, 27 Nov 2014 07:31:55 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>, 
	"MacDonald, Joe" <Joe_MacDonald@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1413827481-11123-1-git-send-email-joe_macdonald@mentor.com>
	<365E1805BC95084CBE82381A0B869994E75615E9@EU-MBX-01.mgc.mentorg.com>
In-Reply-To: <365E1805BC95084CBE82381A0B869994E75615E9@EU-MBX-01.mgc.mentorg.com>
Subject: Re: [PATCH] libxml2: fix CVE-2014-3660
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
X-List-Received-Date: Thu, 27 Nov 2014 15:32:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/27/2014 05:58 AM, Ahsan, Noor wrote:
> Hi,
>
> Sorry for the false alarm. It was included in master but not in dizzy branch. Kindly include in that branch as well. Thanks.
Sure thing.

thanks for the reminder.

- Armin

>
> Noor
>
> -----Original Message-----
> From: Ahsan, Noor
> Sent: Thursday, November 27, 2014 6:45 PM
> To: 'Joe MacDonald'; openembedded-core@lists.openembedded.org
> Subject: RE: [OE-core] [PATCH] libxml2: fix CVE-2014-3660
>
> Hello,
>
> We sent out this patch but we haven't received any feedback not it was included. Kindly include this in dizzy branch.
>
> Thanks.
>
> Noor
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Joe MacDonald
> Sent: Monday, October 20, 2014 10:51 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] libxml2: fix CVE-2014-3660
>
> It was discovered that the patch for CVE-2014-0191 for libxml2 is incomplete.  It is still possible to have libxml2 incorrectly perform entity substituton even when the application using libxml2 explicitly disables the feature.  This can allow a remote denial-of-service attack on systems with libxml2 prior to 2.9.2.
>
> References:
>      http://www.openwall.com/lists/oss-security/2014/10/17/7
>      https://www.ncsc.nl/actueel/nieuwsberichten/kwetsbaarheid-ontdekt-in-libxml2.html
>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>   meta/recipes-core/libxml/libxml2.inc               |   1 +
>   .../libxml/libxml2/libxml2-CVE-2014-3660.patch     | 147 +++++++++++++++++++++
>   2 files changed, 148 insertions(+)
>   create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
> index bcf9a62..c729c19 100644
> --- a/meta/recipes-core/libxml/libxml2.inc
> +++ b/meta/recipes-core/libxml/libxml2.inc
> @@ -21,6 +21,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
>              file://libxml2-CVE-2014-0191-fix.patch \
>              file://python-sitepackages-dir.patch \
>              file://libxml-m4-use-pkgconfig.patch \
> +           file://libxml2-CVE-2014-3660.patch \
>             "
>
>   BINCONFIG = "${bindir}/xml2-config"
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch
> new file mode 100644
> index 0000000..b9621c9
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch
> @@ -0,0 +1,147 @@
> +From be2a7edaf289c5da74a4f9ed3a0b6c733e775230 Mon Sep 17 00:00:00 2001
> +From: Daniel Veillard <veillard@redhat.com>
> +Date: Thu, 16 Oct 2014 13:59:47 +0800
> +Subject: Fix for CVE-2014-3660
> +
> +Issues related to the billion laugh entity expansion which happened to
> +escape the initial set of fixes
> +
> +Upstream-status: Backport
> +Reference:
> +https://git.gnome.org/browse/libxml2/commit/?id=be2a7edaf289c5da74a4f9e
> +d3a0b6c733e775230&context=3&ignorews=0&ss=0
> +
> +Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> +
> +diff --git a/parser.c b/parser.c
> +index f51e8d2..1d93967 100644
> +--- a/parser.c
> ++++ b/parser.c
> +@@ -130,6 +130,29 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t size,
> +         return (0);
> +     if (ctxt->lastError.code == XML_ERR_ENTITY_LOOP)
> +         return (1);
> ++
> ++    /*
> ++     * This may look absurd but is needed to detect
> ++     * entities problems
> ++     */
> ++    if ((ent != NULL) && (ent->etype != XML_INTERNAL_PREDEFINED_ENTITY) &&
> ++	(ent->content != NULL) && (ent->checked == 0)) {
> ++	unsigned long oldnbent = ctxt->nbentities;
> ++	xmlChar *rep;
> ++
> ++	ent->checked = 1;
> ++
> ++	rep = xmlStringDecodeEntities(ctxt, ent->content,
> ++				  XML_SUBSTITUTE_REF, 0, 0, 0);
> ++
> ++	ent->checked = (ctxt->nbentities - oldnbent + 1) * 2;
> ++	if (rep != NULL) {
> ++	    if (xmlStrchr(rep, '<'))
> ++		ent->checked |= 1;
> ++	    xmlFree(rep);
> ++	    rep = NULL;
> ++	}
> ++    }
> +     if (replacement != 0) {
> + 	if (replacement < XML_MAX_TEXT_LENGTH)
> + 	    return(0);
> +@@ -189,9 +212,12 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t size,
> +             return (0);
> +     } else {
> +         /*
> +-         * strange we got no data for checking just return
> ++         * strange we got no data for checking
> +          */
> +-        return (0);
> ++	if (((ctxt->lastError.code != XML_ERR_UNDECLARED_ENTITY) &&
> ++	     (ctxt->lastError.code != XML_WAR_UNDECLARED_ENTITY)) ||
> ++	    (ctxt->nbentities <= 10000))
> ++	    return (0);
> +     }
> +     xmlFatalErr(ctxt, XML_ERR_ENTITY_LOOP, NULL);
> +     return (1);
> +@@ -2589,6 +2615,7 @@ xmlParserHandlePEReference(xmlParserCtxtPtr ctxt) {
> + 				      name, NULL);
> + 		    ctxt->valid = 0;
> + 		}
> ++		xmlParserEntityCheck(ctxt, 0, NULL, 0);
> + 	    } else if (ctxt->input->free != deallocblankswrapper) {
> + 		    input = xmlNewBlanksWrapperInputStream(ctxt, entity);
> + 		    if (xmlPushInput(ctxt, input) < 0) @@ -2759,6 +2786,7 @@
> +xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
> + 	    if ((ctxt->lastError.code == XML_ERR_ENTITY_LOOP) ||
> + 	        (ctxt->lastError.code == XML_ERR_INTERNAL_ERROR))
> + 	        goto int_error;
> ++	    xmlParserEntityCheck(ctxt, 0, ent, 0);
> + 	    if (ent != NULL)
> + 	        ctxt->nbentities += ent->checked / 2;
> + 	    if ((ent != NULL) &&
> +@@ -2810,6 +2838,7 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
> + 	    ent = xmlParseStringPEReference(ctxt, &str);
> + 	    if (ctxt->lastError.code == XML_ERR_ENTITY_LOOP)
> + 	        goto int_error;
> ++	    xmlParserEntityCheck(ctxt, 0, ent, 0);
> + 	    if (ent != NULL)
> + 	        ctxt->nbentities += ent->checked / 2;
> + 	    if (ent != NULL) {
> +@@ -7312,6 +7341,7 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
> + 		   (ret != XML_WAR_UNDECLARED_ENTITY)) {
> + 	    xmlFatalErrMsgStr(ctxt, XML_ERR_UNDECLARED_ENTITY,
> + 		     "Entity '%s' failed to parse\n", ent->name);
> ++	    xmlParserEntityCheck(ctxt, 0, ent, 0);
> + 	} else if (list != NULL) {
> + 	    xmlFreeNodeList(list);
> + 	    list = NULL;
> +@@ -7418,7 +7448,7 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
> + 		/*
> + 		 * We are copying here, make sure there is no abuse
> + 		 */
> +-		ctxt->sizeentcopy += ent->length;
> ++		ctxt->sizeentcopy += ent->length + 5;
> + 		if (xmlParserEntityCheck(ctxt, 0, ent, ctxt->sizeentcopy))
> + 		    return;
> +
> +@@ -7466,7 +7496,7 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
> + 		/*
> + 		 * We are copying here, make sure there is no abuse
> + 		 */
> +-		ctxt->sizeentcopy += ent->length;
> ++		ctxt->sizeentcopy += ent->length + 5;
> + 		if (xmlParserEntityCheck(ctxt, 0, ent, ctxt->sizeentcopy))
> + 		    return;
> +
> +@@ -7652,6 +7682,7 @@ xmlParseEntityRef(xmlParserCtxtPtr ctxt) {
> + 		ctxt->sax->reference(ctxt->userData, name);
> + 	    }
> + 	}
> ++	xmlParserEntityCheck(ctxt, 0, ent, 0);
> + 	ctxt->valid = 0;
> +     }
> +
> +@@ -7845,6 +7876,7 @@ xmlParseStringEntityRef(xmlParserCtxtPtr ctxt, const xmlChar ** str) {
> + 			  "Entity '%s' not defined\n",
> + 			  name);
> + 	}
> ++	xmlParserEntityCheck(ctxt, 0, ent, 0);
> + 	/* TODO ? check regressions ctxt->valid = 0; */
> +     }
> +
> +@@ -8004,6 +8036,7 @@ xmlParsePEReference(xmlParserCtxtPtr ctxt)
> + 			  name, NULL);
> + 	    ctxt->valid = 0;
> + 	}
> ++	xmlParserEntityCheck(ctxt, 0, NULL, 0);
> +     } else {
> + 	/*
> + 	 * Internal checking in case the entity quest barfed @@ -8243,6
> ++8276,7 @@ xmlParseStringPEReference(xmlParserCtxtPtr ctxt, const
> ++xmlChar **str) {
> + 			  name, NULL);
> + 	    ctxt->valid = 0;
> + 	}
> ++	xmlParserEntityCheck(ctxt, 0, NULL, 0);
> +     } else {
> + 	/*
> + 	 * Internal checking in case the entity quest barfed
> +--
> +cgit v0.10.1
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

