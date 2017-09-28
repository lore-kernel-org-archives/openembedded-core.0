Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id A511D73115
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 16:18:22 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 21so2026252iof.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 09:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=87A7X6D/MkWCia6eSAE4PoK77QQhEJAxOlqzGn5UCk0=;
	b=uGaQNch/ZU7xRnCrKIiCa+Jjvq02D4QkeGjUfU/dE+0bqqy7ixjP6j167EJg4qA5kb
	bHRjrqwf6QHt81sAqp06mPp+czjT/0HUO5eS8kZyT21WcWmtfXUFtfCDSbdoN8ij7m6P
	h3CmAdyWqgRaehLEeASrLxt+w8cr58e8OBrlEPDqgOHFsVecyBHr5VdBK1GBjMCHj+Yp
	8NFVbvoXxubYJtdqwFxey1Z+Gk03waw5yyYlkqxozHmmToAzGkrv2UbRQ3GixECW6E8I
	lgF5rjDcvfe/EJ/EQ8eTIjV+xRy9NkCbKuGu8eqhqoSOqGitYQbCCZwQGiNqxZTE6sNS
	2nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=87A7X6D/MkWCia6eSAE4PoK77QQhEJAxOlqzGn5UCk0=;
	b=WWRu/wtu4egIrppW8iLNUWhMFycqhFQx5f3yU13wa4TwiFkP6Oi4uOUICEMyi3j2Jr
	qIzHvSADIDcPBF4gvLIVq4RyDx8c+q1q7zsuP+rBhtTnhZK+mp82eVuC7kymtDWurLQS
	mN3acHv3L8mgKCHpqHsoauamRbbN6j7AC6jzDkKwHlWRHDWQYU7mPcKcPRR8x50C5m5U
	k5MSTAMLkMdOT8TODEq6d31Y/W/XaQOLvgKyVKpthOQ8pKapgd/AyzStuC1R7tzF4ov/
	MxEBrWU2BOWcY2PX/XFMybeSGCkdN0jA269Y6xYP3te8Pw8mi3v2ELJZs0Wg5jCVJHg0
	tFrQ==
X-Gm-Message-State: AMCzsaW56FFl6d8ViAYo1+rL6PmMZLOKbMDTGZIQGr18z/Gv/LTn2KV1
	f14fvAbJTZN6BCK80NBla8nf/xAREADoxunUPqtgMiay
X-Google-Smtp-Source: AOwi7QANrTYscnAOP0joPrZeQwes0pFoquI479Z8Dnp2nKOcT/tkCg7ry+U7ww40y1VuTIdtgkHpE2x+6b6iYVyva9Q=
X-Received: by 10.107.133.92 with SMTP id h89mr7542598iod.208.1506615503068;
	Thu, 28 Sep 2017 09:18:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 28 Sep 2017 09:18:02 -0700 (PDT)
In-Reply-To: <1506600376-23974-1-git-send-email-andrej.valek@siemens.com>
References: <1504593353-7409-1-git-send-email-andrej.valek@siemens.com>
	<1506600376-23974-1-git-send-email-andrej.valek@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Sep 2017 17:18:02 +0100
Message-ID: <CAJTo0LZS99LiWFeYSfNGAWnz7zjMO5R-fYrSM4m_FXG2Ff-UmA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libxml2: 2.9.4 -> 2.9.5
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
X-List-Received-Date: Thu, 28 Sep 2017 16:18:23 -0000
Content-Type: multipart/alternative; boundary="001a113ff7d0dfd1c0055a42418a"

--001a113ff7d0dfd1c0055a42418a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry but:

| NOTE: make
DESTDIR=3D/data/poky-tmp/master/build/work/corei7-64-poky-linux/libxml2/2.9=
.5-r0/image/usr/lib/libxml2/ptest
install-ptest
| install: cannot stat 'testSchemas': No such file or directory
| install: cannot stat 'testRelax': No such file or directory
| install: cannot stat 'testSAX': No such file or directory
| install: cannot stat 'testHTML': No such file or directory
| install: cannot stat 'testXPath': No such file or directory
| install: cannot stat 'testURI': No such file or directory
| install: cannot stat 'testThreads': No such file or directory
| install: cannot stat 'testC14N': No such file or directory
| install: cannot stat 'testAutomata': No such file or directory
| install: cannot stat 'testRegexp': No such file or directory
| install: cannot stat 'testReader': No such file or directory
| install: cannot stat 'testapi': No such file or directory
| install: cannot stat 'testModule': No such file or directory
| install: cannot stat 'runtest': No such file or directory
| install: cannot stat 'runsuite': No such file or directory
| install: cannot stat 'testchar': No such file or directory
| install: cannot stat 'testdict': No such file or directory
| install: cannot stat 'runxmlconf': No such file or directory
| install: cannot stat 'testrecurse': No such file or directory
| install: cannot stat 'testlimits': No such file or directory
| Makefile:1908: recipe for target 'install-ptest' failed

Ross


On 28 September 2017 at 13:06, Andrej Valek <andrej.valek@siemens.com>
wrote:

> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../libxml/libxml2/libxml-m4-use-pkgconfig.patch   |   2 +-
>  .../libxml/libxml2/libxml2-CVE-2016-4658.patch     | 269 ----------
>  .../libxml/libxml2/libxml2-CVE-2016-5131.patch     | 180 -------
>  .../libxml/libxml2/libxml2-CVE-2017-0663.patch     |  40 --
>  .../libxml/libxml2/libxml2-CVE-2017-5969.patch     |  62 ---
>  .../libxml/libxml2/libxml2-CVE-2017-8872.patch     |  37 --
>  .../libxml2-CVE-2017-9047_CVE-2017-9048.patch      | 103 ----
>  .../libxml2-CVE-2017-9049_CVE-2017-9050.patch      | 291 ----------
>  .../libxml2/libxml2-fix_NULL_pointer_derefs.patch  |  45 --
>  ...ibxml2-fix_and_simplify_xmlParseStartTag2.patch | 590
> ---------------------
>  .../libxml2/libxml2-fix_node_comparison.patch      |  67 ---
>  meta/recipes-core/libxml/libxml2/runtest.patch     |  34 +-
>  .../libxml/{libxml2_2.9.4.bb =3D> libxml2_2.9.5.bb}  |  14 +-
>  13 files changed, 11 insertions(+), 1723 deletions(-)
>  delete mode 100644 meta/recipes-core/libxml/
> libxml2/libxml2-CVE-2016-4658.patch
>  delete mode 100644 meta/recipes-core/libxml/
> libxml2/libxml2-CVE-2016-5131.patch
>  delete mode 100644 meta/recipes-core/libxml/
> libxml2/libxml2-CVE-2017-0663.patch
>  delete mode 100644 meta/recipes-core/libxml/
> libxml2/libxml2-CVE-2017-5969.patch
>  delete mode 100644 meta/recipes-core/libxml/
> libxml2/libxml2-CVE-2017-8872.patch
>  delete mode 100644 meta/recipes-core/libxml/
> libxml2/libxml2-CVE-2017-9047_CVE-2017-9048.patch
>  delete mode 100644 meta/recipes-core/libxml/
> libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch
>  delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_
> pointer_derefs.patch
>  delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_and_
> simplify_xmlParseStartTag2.patch
>  delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_node_
> comparison.patch
>  rename meta/recipes-core/libxml/{libxml2_2.9.4.bb =3D> libxml2_2.9.5.bb}
> (85%)
>
> diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.pat=
ch
> b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
> index 3277165..d9ed151 100644
> --- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
> +++ b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
> @@ -183,7 +183,7 @@ index 68cd824..5fa0a9b 100644
>  -          echo "*** If you have an old version installed, it is best to
> remove it, although"
>  -          echo "*** you may also be able to get things to work by
> modifying LD_LIBRARY_PATH" ],
>  -        [ echo "*** The test program failed to compile or link. See the
> file config.log for the"
> --          echo "*** exact error that occured. This usually means LIBXML
> was incorrectly installed"
> +-          echo "*** exact error that occurred. This usually means LIBXM=
L
> was incorrectly installed"
>  -          echo "*** or that you have moved LIBXML since it was
> installed. In the latter case, you"
>  -          echo "*** may want to edit the xml2-config script:
> $XML2_CONFIG" ])
>  -          CPPFLAGS=3D"$ac_save_CPPFLAGS"
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch
> b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch
> deleted file mode 100644
> index bb55eed..0000000
> --- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch
> +++ /dev/null
> @@ -1,269 +0,0 @@
> -libxml2-2.9.4: Fix CVE-2016-4658
> -
> -[No upstream tracking] -- https://bugzilla.redhat.com/
> show_bug.cgi?id=3DCVE-2016-4658
> -
> -xpointer: Disallow namespace nodes in XPointer points and ranges
> -
> -Namespace nodes must be copied to avoid use-after-free errors.
> -But they don't necessarily have a physical representation in a
> -document, so simply disallow them in XPointer ranges.
> -
> -Upstream-Status: Backport
> - - [https://git.gnome.org/browse/libxml2/commit/?id=3D
> c1d1f7121194036608bf555f08d3062a36fd344b]
> - - [https://git.gnome.org/browse/libxml2/commit/?id=3D
> 3f8a91036d338e51c059d54397a42d645f019c65]
> -CVE: CVE-2016-4658
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> -
> -diff --git a/xpointer.c b/xpointer.c
> -index 676c510..911680d 100644
> ---- a/xpointer.c
> -+++ b/xpointer.c
> -@@ -320,6 +320,45 @@ xmlXPtrRangesEqual(xmlXPathObjectPtr range1,
> xmlXPathObjectPtr range2) {
> - }
> -
> - /**
> -+ * xmlXPtrNewRangeInternal:
> -+ * @start:  the starting node
> -+ * @startindex:  the start index
> -+ * @end:  the ending point
> -+ * @endindex:  the ending index
> -+ *
> -+ * Internal function to create a new xmlXPathObjectPtr of type range
> -+ *
> -+ * Returns the newly created object.
> -+ */
> -+static xmlXPathObjectPtr
> -+xmlXPtrNewRangeInternal(xmlNodePtr start, int startindex,
> -+                        xmlNodePtr end, int endindex) {
> -+    xmlXPathObjectPtr ret;
> -+
> -+    /*
> -+     * Namespace nodes must be copied (see xmlXPathNodeSetDupNs).
> -+     * Disallow them for now.
> -+     */
> -+    if ((start !=3D NULL) && (start->type =3D=3D XML_NAMESPACE_DECL))
> -+      return(NULL);
> -+    if ((end !=3D NULL) && (end->type =3D=3D XML_NAMESPACE_DECL))
> -+      return(NULL);
> -+
> -+    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
> -+    if (ret =3D=3D NULL) {
> -+        xmlXPtrErrMemory("allocating range");
> -+      return(NULL);
> -+    }
> -+    memset(ret, 0, sizeof(xmlXPathObject));
> -+    ret->type =3D XPATH_RANGE;
> -+    ret->user =3D start;
> -+    ret->index =3D startindex;
> -+    ret->user2 =3D end;
> -+    ret->index2 =3D endindex;
> -+    return(ret);
> -+}
> -+
> -+/**
> -  * xmlXPtrNewRange:
> -  * @start:  the starting node
> -  * @startindex:  the start index
> -@@ -344,17 +383,7 @@ xmlXPtrNewRange(xmlNodePtr start, int startindex,
> -     if (endindex < 0)
> -       return(NULL);
> -
> --    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
> --    if (ret =3D=3D NULL) {
> --        xmlXPtrErrMemory("allocating range");
> --      return(NULL);
> --    }
> --    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
> --    ret->type =3D XPATH_RANGE;
> --    ret->user =3D start;
> --    ret->index =3D startindex;
> --    ret->user2 =3D end;
> --    ret->index2 =3D endindex;
> -+    ret =3D xmlXPtrNewRangeInternal(start, startindex, end, endindex);
> -     xmlXPtrRangeCheckOrder(ret);
> -     return(ret);
> - }
> -@@ -381,17 +410,8 @@ xmlXPtrNewRangePoints(xmlXPathObjectPtr start,
> xmlXPathObjectPtr end) {
> -     if (end->type !=3D XPATH_POINT)
> -       return(NULL);
> -
> --    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
> --    if (ret =3D=3D NULL) {
> --        xmlXPtrErrMemory("allocating range");
> --      return(NULL);
> --    }
> --    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
> --    ret->type =3D XPATH_RANGE;
> --    ret->user =3D start->user;
> --    ret->index =3D start->index;
> --    ret->user2 =3D end->user;
> --    ret->index2 =3D end->index;
> -+    ret =3D xmlXPtrNewRangeInternal(start->user, start->index, end->use=
r,
> -+                                end->index);
> -     xmlXPtrRangeCheckOrder(ret);
> -     return(ret);
> - }
> -@@ -416,17 +436,7 @@ xmlXPtrNewRangePointNode(xmlXPathObjectPtr start,
> xmlNodePtr end) {
> -     if (start->type !=3D XPATH_POINT)
> -       return(NULL);
> -
> --    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
> --    if (ret =3D=3D NULL) {
> --        xmlXPtrErrMemory("allocating range");
> --      return(NULL);
> --    }
> --    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
> --    ret->type =3D XPATH_RANGE;
> --    ret->user =3D start->user;
> --    ret->index =3D start->index;
> --    ret->user2 =3D end;
> --    ret->index2 =3D -1;
> -+    ret =3D xmlXPtrNewRangeInternal(start->user, start->index, end, -1)=
;
> -     xmlXPtrRangeCheckOrder(ret);
> -     return(ret);
> - }
> -@@ -453,17 +463,7 @@ xmlXPtrNewRangeNodePoint(xmlNodePtr start,
> xmlXPathObjectPtr end) {
> -     if (end->type !=3D XPATH_POINT)
> -       return(NULL);
> -
> --    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
> --    if (ret =3D=3D NULL) {
> --        xmlXPtrErrMemory("allocating range");
> --      return(NULL);
> --    }
> --    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
> --    ret->type =3D XPATH_RANGE;
> --    ret->user =3D start;
> --    ret->index =3D -1;
> --    ret->user2 =3D end->user;
> --    ret->index2 =3D end->index;
> -+    ret =3D xmlXPtrNewRangeInternal(start, -1, end->user, end->index);
> -     xmlXPtrRangeCheckOrder(ret);
> -     return(ret);
> - }
> -@@ -486,17 +486,7 @@ xmlXPtrNewRangeNodes(xmlNodePtr start, xmlNodePtr
> end) {
> -     if (end =3D=3D NULL)
> -       return(NULL);
> -
> --    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
> --    if (ret =3D=3D NULL) {
> --        xmlXPtrErrMemory("allocating range");
> --      return(NULL);
> --    }
> --    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
> --    ret->type =3D XPATH_RANGE;
> --    ret->user =3D start;
> --    ret->index =3D -1;
> --    ret->user2 =3D end;
> --    ret->index2 =3D -1;
> -+    ret =3D xmlXPtrNewRangeInternal(start, -1, end, -1);
> -     xmlXPtrRangeCheckOrder(ret);
> -     return(ret);
> - }
> -@@ -516,17 +506,7 @@ xmlXPtrNewCollapsedRange(xmlNodePtr start) {
> -     if (start =3D=3D NULL)
> -       return(NULL);
> -
> --    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
> --    if (ret =3D=3D NULL) {
> --        xmlXPtrErrMemory("allocating range");
> --      return(NULL);
> --    }
> --    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
> --    ret->type =3D XPATH_RANGE;
> --    ret->user =3D start;
> --    ret->index =3D -1;
> --    ret->user2 =3D NULL;
> --    ret->index2 =3D -1;
> -+    ret =3D xmlXPtrNewRangeInternal(start, -1, NULL, -1);
> -     return(ret);
> - }
> -
> -@@ -541,6 +521,8 @@ xmlXPtrNewCollapsedRange(xmlNodePtr start) {
> -  */
> - xmlXPathObjectPtr
> - xmlXPtrNewRangeNodeObject(xmlNodePtr start, xmlXPathObjectPtr end) {
> -+    xmlNodePtr endNode;
> -+    int endIndex;
> -     xmlXPathObjectPtr ret;
> -
> -     if (start =3D=3D NULL)
> -@@ -549,7 +531,12 @@ xmlXPtrNewRangeNodeObject(xmlNodePtr start,
> xmlXPathObjectPtr end) {
> -       return(NULL);
> -     switch (end->type) {
> -       case XPATH_POINT:
> -+          endNode =3D end->user;
> -+          endIndex =3D end->index;
> -+          break;
> -       case XPATH_RANGE:
> -+          endNode =3D end->user2;
> -+          endIndex =3D end->index2;
> -           break;
> -       case XPATH_NODESET:
> -           /*
> -@@ -557,39 +544,15 @@ xmlXPtrNewRangeNodeObject(xmlNodePtr start,
> xmlXPathObjectPtr end) {
> -            */
> -           if (end->nodesetval->nodeNr <=3D 0)
> -               return(NULL);
> -+          endNode =3D end->nodesetval->nodeTab[end->nodesetval->nodeNr =
-
> 1];
> -+          endIndex =3D -1;
> -           break;
> -       default:
> -           /* TODO */
> -           return(NULL);
> -     }
> -
> --    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
> --    if (ret =3D=3D NULL) {
> --        xmlXPtrErrMemory("allocating range");
> --      return(NULL);
> --    }
> --    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
> --    ret->type =3D XPATH_RANGE;
> --    ret->user =3D start;
> --    ret->index =3D -1;
> --    switch (end->type) {
> --      case XPATH_POINT:
> --          ret->user2 =3D end->user;
> --          ret->index2 =3D end->index;
> --          break;
> --      case XPATH_RANGE:
> --          ret->user2 =3D end->user2;
> --          ret->index2 =3D end->index2;
> --          break;
> --      case XPATH_NODESET: {
> --          ret->user2 =3D end->nodesetval->nodeTab[end->nodesetval->node=
Nr
> - 1];
> --          ret->index2 =3D -1;
> --          break;
> --      }
> --      default:
> --          STRANGE
> --          return(NULL);
> --    }
> -+    ret =3D xmlXPtrNewRangeInternal(start, -1, endNode, endIndex);
> -     xmlXPtrRangeCheckOrder(ret);
> -     return(ret);
> - }
> -@@ -1835,8 +1798,8 @@ xmlXPtrStartPointFunction(xmlXPathParserContextPtr
> ctxt, int nargs) {
> -               case XPATH_RANGE: {
> -                   xmlNodePtr node =3D tmp->user;
> -                   if (node !=3D NULL) {
> --                      if (node->type =3D=3D XML_ATTRIBUTE_NODE) {
> --                          /* TODO: Namespace Nodes ??? */
> -+                      if ((node->type =3D=3D XML_ATTRIBUTE_NODE) ||
> -+                           (node->type =3D=3D XML_NAMESPACE_DECL)) {
> -                           xmlXPathFreeObject(obj);
> -                           xmlXPtrFreeLocationSet(newset);
> -                           XP_ERROR(XPTR_SYNTAX_ERROR);
> -@@ -1931,8 +1894,8 @@ xmlXPtrEndPointFunction(xmlXPathParserContextPtr
> ctxt, int nargs) {
> -               case XPATH_RANGE: {
> -                   xmlNodePtr node =3D tmp->user2;
> -                   if (node !=3D NULL) {
> --                      if (node->type =3D=3D XML_ATTRIBUTE_NODE) {
> --                          /* TODO: Namespace Nodes ??? */
> -+                      if ((node->type =3D=3D XML_ATTRIBUTE_NODE) ||
> -+                           (node->type =3D=3D XML_NAMESPACE_DECL)) {
> -                           xmlXPathFreeObject(obj);
> -                           xmlXPtrFreeLocationSet(newset);
> -                           XP_ERROR(XPTR_SYNTAX_ERROR);
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch
> b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch
> deleted file mode 100644
> index 9d47d02..0000000
> --- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch
> +++ /dev/null
> @@ -1,180 +0,0 @@
> -From 9ab01a277d71f54d3143c2cf333c5c2e9aaedd9e Mon Sep 17 00:00:00 2001
> -From: Nick Wellnhofer <wellnhofer@aevum.de>
> -Date: Tue, 28 Jun 2016 14:22:23 +0200
> -Subject: [PATCH] Fix XPointer paths beginning with range-to
> -
> -The old code would invoke the broken xmlXPtrRangeToFunction. range-to
> -isn't really a function but a special kind of location step. Remove
> -this function and always handle range-to in the XPath code.
> -
> -The old xmlXPtrRangeToFunction could also be abused to trigger a
> -use-after-free error with the potential for remote code execution.
> -
> -Found with afl-fuzz.
> -
> -Fixes CVE-2016-5131.
> -
> -CVE: CVE-2016-5131
> -Upstream-Status: Backport
> -https://git.gnome.org/browse/libxml2/commit/?id=3D
> 9ab01a277d71f54d3143c2cf333c5c2e9aaedd9e
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
> ----
> - result/XPath/xptr/vidbase | 13 ++++++++
> - test/XPath/xptr/vidbase   |  1 +
> - xpath.c                   |  7 ++++-
> - xpointer.c                | 76 ++++--------------------------
> -----------------
> - 4 files changed, 26 insertions(+), 71 deletions(-)
> -
> -diff --git a/result/XPath/xptr/vidbase b/result/XPath/xptr/vidbase
> -index 8b9e92d..f19193e 100644
> ---- a/result/XPath/xptr/vidbase
> -+++ b/result/XPath/xptr/vidbase
> -@@ -17,3 +17,16 @@ Object is a Location Set:
> -   To node
> -     ELEMENT p
> -
> -+
> -+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> -+Expression: xpointer(range-to(id('chapter2')))
> -+Object is a Location Set:
> -+1 :   Object is a range :
> -+  From node
> -+     /
> -+  To node
> -+    ELEMENT chapter
> -+      ATTRIBUTE id
> -+        TEXT
> -+          content=3Dchapter2
> -+
> -diff --git a/test/XPath/xptr/vidbase b/test/XPath/xptr/vidbase
> -index b146383..884b106 100644
> ---- a/test/XPath/xptr/vidbase
> -+++ b/test/XPath/xptr/vidbase
> -@@ -1,2 +1,3 @@
> - xpointer(id('chapter1')/p)
> - xpointer(id('chapter1')/p[1]/range-to(following-sibling::p[2]))
> -+xpointer(range-to(id('chapter2')))
> -diff --git a/xpath.c b/xpath.c
> -index d992841..5a01b1b 100644
> ---- a/xpath.c
> -+++ b/xpath.c
> -@@ -10691,13 +10691,18 @@ xmlXPathCompPathExpr(xmlXPathParserContextPtr
> ctxt) {
> -                   lc =3D 1;
> -                   break;
> -               } else if ((NXT(len) =3D=3D '(')) {
> --                  /* Note Type or Function */
> -+                  /* Node Type or Function */
> -                   if (xmlXPathIsNodeType(name)) {
> - #ifdef DEBUG_STEP
> -                       xmlGenericError(xmlGenericErrorContext,
> -                               "PathExpr: Type search\n");
> - #endif
> -                       lc =3D 1;
> -+#ifdef LIBXML_XPTR_ENABLED
> -+                    } else if (ctxt->xptr &&
> -+                               xmlStrEqual(name, BAD_CAST "range-to")) =
{
> -+                        lc =3D 1;
> -+#endif
> -                   } else {
> - #ifdef DEBUG_STEP
> -                       xmlGenericError(xmlGenericErrorContext,
> -diff --git a/xpointer.c b/xpointer.c
> -index 676c510..d74174a 100644
> ---- a/xpointer.c
> -+++ b/xpointer.c
> -@@ -1332,8 +1332,6 @@ xmlXPtrNewContext(xmlDocPtr doc, xmlNodePtr here,
> xmlNodePtr origin) {
> -     ret->here =3D here;
> -     ret->origin =3D origin;
> -
> --    xmlXPathRegisterFunc(ret, (xmlChar *)"range-to",
> --                       xmlXPtrRangeToFunction);
> -     xmlXPathRegisterFunc(ret, (xmlChar *)"range",
> -                        xmlXPtrRangeFunction);
> -     xmlXPathRegisterFunc(ret, (xmlChar *)"range-inside",
> -@@ -2243,76 +2241,14 @@ xmlXPtrRangeInsideFunction(xmlXPathParserContext=
Ptr
> ctxt, int nargs) {
> -  * @nargs:  the number of args
> -  *
> -  * Implement the range-to() XPointer function
> -+ *
> -+ * Obsolete. range-to is not a real function but a special type of
> location
> -+ * step which is handled in xpath.c.
> -  */
> - void
> --xmlXPtrRangeToFunction(xmlXPathParserContextPtr ctxt, int nargs) {
> --    xmlXPathObjectPtr range;
> --    const xmlChar *cur;
> --    xmlXPathObjectPtr res, obj;
> --    xmlXPathObjectPtr tmp;
> --    xmlLocationSetPtr newset =3D NULL;
> --    xmlNodeSetPtr oldset;
> --    int i;
> --
> --    if (ctxt =3D=3D NULL) return;
> --    CHECK_ARITY(1);
> --    /*
> --     * Save the expression pointer since we will have to evaluate
> --     * it multiple times. Initialize the new set.
> --     */
> --    CHECK_TYPE(XPATH_NODESET);
> --    obj =3D valuePop(ctxt);
> --    oldset =3D obj->nodesetval;
> --    ctxt->context->node =3D NULL;
> --
> --    cur =3D ctxt->cur;
> --    newset =3D xmlXPtrLocationSetCreate(NULL);
> --
> --    for (i =3D 0; i < oldset->nodeNr; i++) {
> --      ctxt->cur =3D cur;
> --
> --      /*
> --       * Run the evaluation with a node list made of a single item
> --       * in the nodeset.
> --       */
> --      ctxt->context->node =3D oldset->nodeTab[i];
> --      tmp =3D xmlXPathNewNodeSet(ctxt->context->node);
> --      valuePush(ctxt, tmp);
> --
> --      xmlXPathEvalExpr(ctxt);
> --      CHECK_ERROR;
> --
> --      /*
> --       * The result of the evaluation need to be tested to
> --       * decided whether the filter succeeded or not
> --       */
> --      res =3D valuePop(ctxt);
> --      range =3D xmlXPtrNewRangeNodeObject(oldset->nodeTab[i], res);
> --      if (range !=3D NULL) {
> --          xmlXPtrLocationSetAdd(newset, range);
> --      }
> --
> --      /*
> --       * Cleanup
> --       */
> --      if (res !=3D NULL)
> --          xmlXPathFreeObject(res);
> --      if (ctxt->value =3D=3D tmp) {
> --          res =3D valuePop(ctxt);
> --          xmlXPathFreeObject(res);
> --      }
> --
> --      ctxt->context->node =3D NULL;
> --    }
> --
> --    /*
> --     * The result is used as the new evaluation set.
> --     */
> --    xmlXPathFreeObject(obj);
> --    ctxt->context->node =3D NULL;
> --    ctxt->context->contextSize =3D -1;
> --    ctxt->context->proximityPosition =3D -1;
> --    valuePush(ctxt, xmlXPtrWrapLocationSet(newset));
> -+xmlXPtrRangeToFunction(xmlXPathParserContextPtr ctxt,
> -+                       int nargs ATTRIBUTE_UNUSED) {
> -+    XP_ERROR(XPATH_EXPR_ERROR);
> - }
> -
> - /**
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch
> b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch
> deleted file mode 100644
> index 0108265..0000000
> --- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -libxml2: Fix CVE-2017-0663
> -
> -[No upstream tracking] -- https://bugzilla.gnome.org/
> show_bug.cgi?id=3D780228
> -
> -valid: Fix type confusion in xmlValidateOneNamespace
> -
> -Comment out code that casts xmlNsPtr to xmlAttrPtr. ID types
> -on namespace declarations make no practical sense anyway.
> -
> -Fixes bug 780228
> -
> -Upstream-Status: Backport [https://git.gnome.org/browse/
> libxml2/commit/?id=3D92b9e8c8b3787068565a1820ba575d042f9eec66]
> -CVE: CVE-2017-0663
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -
> -diff --git a/valid.c b/valid.c
> -index 19f84b8..e03d35e 100644
> ---- a/valid.c
> -+++ b/valid.c
> -@@ -4621,6 +4621,12 @@ xmlNodePtr elem, const xmlChar *prefix, xmlNsPtr
> ns, const xmlChar *value) {
> -       }
> -     }
> -
> -+    /*
> -+     * Casting ns to xmlAttrPtr is wrong. We'd need separate functions
> -+     * xmlAddID and xmlAddRef for namespace declarations, but it makes
> -+     * no practical sense to use ID types anyway.
> -+     */
> -+#if 0
> -     /* Validity Constraint: ID uniqueness */
> -     if (attrDecl->atype =3D=3D XML_ATTRIBUTE_ID) {
> -         if (xmlAddID(ctxt, doc, value, (xmlAttrPtr) ns) =3D=3D NULL)
> -@@ -4632,6 +4638,7 @@ xmlNodePtr elem, const xmlChar *prefix, xmlNsPtr
> ns, const xmlChar *value) {
> -         if (xmlAddRef(ctxt, doc, value, (xmlAttrPtr) ns) =3D=3D NULL)
> -           ret =3D 0;
> -     }
> -+#endif
> -
> -     /* Validity Constraint: Notation Attributes */
> -     if (attrDecl->atype =3D=3D XML_ATTRIBUTE_NOTATION) {
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch
> b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch
> deleted file mode 100644
> index 571b05c..0000000
> --- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -libxml2-2.9.4: Fix CVE-2017-5969
> -
> -[No upstream tracking] -- https://bugzilla.gnome.org/
> show_bug.cgi?id=3D758422
> -
> -valid: Fix NULL pointer deref in xmlDumpElementContent
> -
> -Can only be triggered in recovery mode.
> -
> -Fixes bug 758422
> -
> -Upstream-Status: Backport - [https://git.gnome.org/browse/
> libxml2/commit/?id=3D94691dc884d1a8ada39f073408b4bb92fe7fe882]
> -CVE: CVE-2017-5969
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -
> -diff --git a/valid.c b/valid.c
> -index 19f84b8..0a8e58a 100644
> ---- a/valid.c
> -+++ b/valid.c
> -@@ -1172,29 +1172,33 @@ xmlDumpElementContent(xmlBufferPtr buf,
> xmlElementContentPtr content, int glob)
> -           xmlBufferWriteCHAR(buf, content->name);
> -           break;
> -       case XML_ELEMENT_CONTENT_SEQ:
> --          if ((content->c1->type =3D=3D XML_ELEMENT_CONTENT_OR) ||
> --              (content->c1->type =3D=3D XML_ELEMENT_CONTENT_SEQ))
> -+          if ((content->c1 !=3D NULL) &&
> -+              ((content->c1->type =3D=3D XML_ELEMENT_CONTENT_OR) ||
> -+               (content->c1->type =3D=3D XML_ELEMENT_CONTENT_SEQ)))
> -               xmlDumpElementContent(buf, content->c1, 1);
> -           else
> -               xmlDumpElementContent(buf, content->c1, 0);
> -             xmlBufferWriteChar(buf, " , ");
> --          if ((content->c2->type =3D=3D XML_ELEMENT_CONTENT_OR) ||
> --              ((content->c2->type =3D=3D XML_ELEMENT_CONTENT_SEQ) &&
> --               (content->c2->ocur !=3D XML_ELEMENT_CONTENT_ONCE)))
> -+          if ((content->c2 !=3D NULL) &&
> -+              ((content->c2->type =3D=3D XML_ELEMENT_CONTENT_OR) ||
> -+               ((content->c2->type =3D=3D XML_ELEMENT_CONTENT_SEQ) &&
> -+                (content->c2->ocur !=3D XML_ELEMENT_CONTENT_ONCE))))
> -               xmlDumpElementContent(buf, content->c2, 1);
> -           else
> -               xmlDumpElementContent(buf, content->c2, 0);
> -           break;
> -       case XML_ELEMENT_CONTENT_OR:
> --          if ((content->c1->type =3D=3D XML_ELEMENT_CONTENT_OR) ||
> --              (content->c1->type =3D=3D XML_ELEMENT_CONTENT_SEQ))
> -+          if ((content->c1 !=3D NULL) &&
> -+              ((content->c1->type =3D=3D XML_ELEMENT_CONTENT_OR) ||
> -+               (content->c1->type =3D=3D XML_ELEMENT_CONTENT_SEQ)))
> -               xmlDumpElementContent(buf, content->c1, 1);
> -           else
> -               xmlDumpElementContent(buf, content->c1, 0);
> -             xmlBufferWriteChar(buf, " | ");
> --          if ((content->c2->type =3D=3D XML_ELEMENT_CONTENT_SEQ) ||
> --              ((content->c2->type =3D=3D XML_ELEMENT_CONTENT_OR) &&
> --               (content->c2->ocur !=3D XML_ELEMENT_CONTENT_ONCE)))
> -+          if ((content->c2 !=3D NULL) &&
> -+              ((content->c2->type =3D=3D XML_ELEMENT_CONTENT_SEQ) ||
> -+               ((content->c2->type =3D=3D XML_ELEMENT_CONTENT_OR) &&
> -+                (content->c2->ocur !=3D XML_ELEMENT_CONTENT_ONCE))))
> -               xmlDumpElementContent(buf, content->c2, 1);
> -           else
> -               xmlDumpElementContent(buf, content->c2, 0);
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
> b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
> deleted file mode 100644
> index 26779aa..0000000
> --- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From d2f873a541c72b0f67e15562819bf98b884b30b7 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Wed, 23 Aug 2017 16:04:49 +0800
> -Subject: [PATCH] fix CVE-2017-8872
> -
> -this makes xmlHaltParser "empty" the buffer, as it resets cur and ava
> -il too here.
> -
> -this seems to cure this specific issue, and also passes the testsuite
> -
> -Signed-off-by: Marcus Meissner <meissner@suse.de>
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=3D775200
> -Upstream-Status: Backport [https://bugzilla.gnome.org/
> attachment.cgi?id=3D355527&action=3Ddiff]
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - parser.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/parser.c b/parser.c
> -index 9506ead..6c07ffd 100644
> ---- a/parser.c
> -+++ b/parser.c
> -@@ -12664,6 +12664,10 @@ xmlHaltParser(xmlParserCtxtPtr ctxt) {
> -       }
> -       ctxt->input->cur =3D BAD_CAST"";
> -       ctxt->input->base =3D ctxt->input->cur;
> -+      if (ctxt->input->buf) {
> -+              xmlBufEmpty (ctxt->input->buf->buffer);
> -+      } else
> -+              ctxt->input->length =3D 0;
> -     }
> - }
> -
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9047_CVE-2=
017-9048.patch
> b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9047_
> CVE-2017-9048.patch
> deleted file mode 100644
> index 8b03456..0000000
> --- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9047_
> CVE-2017-9048.patch
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -libxml2-2.9.4: Fix CVE-2017-9047 and CVE-2017-9048
> -
> -[No upstream tracking] -- https://bugzilla.gnome.org/
> show_bug.cgi?id=3D781333
> - -- https://bugzilla.gnome.org/show_bug.cgi?id=3D781701
> -
> -valid: Fix buffer size checks in xmlSnprintfElementContent
> -
> -xmlSnprintfElementContent failed to correctly check the available
> -buffer space in two locations.
> -
> -Fixes bug 781333 and bug 781701
> -
> -Upstream-Status: Backport [https://git.gnome.org/browse/
> libxml2/commit/?id=3D932cc9896ab41475d4aa429c27d9afd175959d74]
> -CVE: CVE-2017-9047 CVE-2017-9048
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -
> -diff --git a/result/valid/781333.xml b/result/valid/781333.xml
> -new file mode 100644
> -index 0000000..01baf11
> ---- /dev/null
> -+++ b/result/valid/781333.xml
> -@@ -0,0 +1,5 @@
> -+<?xml version=3D"1.0"?>
> -+<!DOCTYPE a [
> -+<!ELEMENT a (pppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppp!
>  ppppppppp
>  pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppp!
>  ppppppppp
>  pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppp!
>  ppppppppp
>  pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppp!
>  ppppppppp
>  pppppppppppppppppppppppppp:llllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> lllllllllllllllllllllllllllllll!
>  lllllllll
>  llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllll!
>  lllllllll
>  lllllllllllllllllllllllllllllllll)>
> -+]>
> -+<a/>
> -diff --git a/result/valid/781333.xml.err b/result/valid/781333.xml.err
> -new file mode 100644
> -index 0000000..2176200
> ---- /dev/null
> -+++ b/result/valid/781333.xml.err
> -@@ -0,0 +1,3 @@
> -+./test/valid/781333.xml:4: element a: validity error : Element a conten=
t
> does not follow the DTD, expecting ( ..., got
> -+<a/>
> -+    ^
> -diff --git a/result/valid/781333.xml.err.rdr
> b/result/valid/781333.xml.err.rdr
> -new file mode 100644
> -index 0000000..1195a04
> ---- /dev/null
> -+++ b/result/valid/781333.xml.err.rdr
> -@@ -0,0 +1,6 @@
> -+./test/valid/781333.xml:4: element a: validity error : Element a conten=
t
> does not follow the DTD, expecting ( ..., got
> -+<a/>
> -+    ^
> -+./test/valid/781333.xml:5: element a: validity error : Element a conten=
t
> does not follow the DTD, Expecting more child
> -+
> -+^
> -diff --git a/test/valid/781333.xml b/test/valid/781333.xml
> -new file mode 100644
> -index 0000000..bceac9c
> ---- /dev/null
> -+++ b/test/valid/781333.xml
> -@@ -0,0 +1,4 @@
> -+<!DOCTYPE a [
> -+    <!ELEMENT a (pppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppp!
>  ppppppppp
>  pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppp!
>  ppppppppp
>  pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppp!
>  ppppppppp
>  pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
> pppppppppppppppppppppppppppp!
>  ppppppppp
>  pppppppppppppppppppppppppppppp:llllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> lllllllllllllllllllllllllll!
>  lllllllll
>  llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
> llllllllllllllllllllllllllll!
>  lllllllll
>  lllllllllllllllllllllllllllllllllllll)>
> -+]>
> -+<a/>
> -diff --git a/valid.c b/valid.c
> -index 19f84b8..aaa30f6 100644
> ---- a/valid.c
> -+++ b/valid.c
> -@@ -1262,22 +1262,23 @@ xmlSnprintfElementContent(char *buf, int size,
> xmlElementContentPtr content, int
> -         case XML_ELEMENT_CONTENT_PCDATA:
> -             strcat(buf, "#PCDATA");
> -           break;
> --      case XML_ELEMENT_CONTENT_ELEMENT:
> -+      case XML_ELEMENT_CONTENT_ELEMENT: {
> -+            int qnameLen =3D xmlStrlen(content->name);
> -+
> -+          if (content->prefix !=3D NULL)
> -+                qnameLen +=3D xmlStrlen(content->prefix) + 1;
> -+          if (size - len < qnameLen + 10) {
> -+              strcat(buf, " ...");
> -+              return;
> -+          }
> -           if (content->prefix !=3D NULL) {
> --              if (size - len < xmlStrlen(content->prefix) + 10) {
> --                  strcat(buf, " ...");
> --                  return;
> --              }
> -               strcat(buf, (char *) content->prefix);
> -               strcat(buf, ":");
> -           }
> --          if (size - len < xmlStrlen(content->name) + 10) {
> --              strcat(buf, " ...");
> --              return;
> --          }
> -           if (content->name !=3D NULL)
> -               strcat(buf, (char *) content->name);
> -           break;
> -+      }
> -       case XML_ELEMENT_CONTENT_SEQ:
> -           if ((content->c1->type =3D=3D XML_ELEMENT_CONTENT_OR) ||
> -               (content->c1->type =3D=3D XML_ELEMENT_CONTENT_SEQ))
> -@@ -1319,6 +1320,7 @@ xmlSnprintfElementContent(char *buf, int size,
> xmlElementContentPtr content, int
> -               xmlSnprintfElementContent(buf, size, content->c2, 0);
> -           break;
> -     }
> -+    if (size - strlen(buf) <=3D 2) return;
> -     if (englob)
> -         strcat(buf, ")");
> -     switch (content->ocur) {
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2=
017-9050.patch
> b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_
> CVE-2017-9050.patch
> deleted file mode 100644
> index 591075d..0000000
> --- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_
> CVE-2017-9050.patch
> +++ /dev/null
> @@ -1,291 +0,0 @@
> -libxml2-2.9.4: Fix CVE-2017-9049 and CVE-2017-9050
> -
> -[No upstream tracking] -- https://bugzilla.gnome.org/
> show_bug.cgi?id=3D781205
> - -- https://bugzilla.gnome.org/show_bug.cgi?id=3D781361
> -
> -parser: Fix handling of parameter-entity references
> -
> -There were two bugs where parameter-entity references could lead to an
> -unexpected change of the input buffer in xmlParseNameComplex and
> -xmlDictLookup being called with an invalid pointer.
> -
> -Percent sign in DTD Names
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> -
> -The NEXTL macro used to call xmlParserHandlePEReference. When parsing
> -"complex" names inside the DTD, this could result in entity expansion
> -which created a new input buffer. The fix is to simply remove the call
> -to xmlParserHandlePEReference from the NEXTL macro. This is safe because
> -no users of the macro require expansion of parameter entities.
> -
> -- xmlParseNameComplex
> -- xmlParseNCNameComplex
> -- xmlParseNmtoken
> -
> -The percent sign is not allowed in names, which are grammatical tokens.
> -
> -- xmlParseEntityValue
> -
> -Parameter-entity references in entity values are expanded but this
> -happens in a separate step in this function.
> -
> -- xmlParseSystemLiteral
> -
> -Parameter-entity references are ignored in the system literal.
> -
> -- xmlParseAttValueComplex
> -- xmlParseCharDataComplex
> -- xmlParseCommentComplex
> -- xmlParsePI
> -- xmlParseCDSect
> -
> -Parameter-entity references are ignored outside the DTD.
> -
> -- xmlLoadEntityContent
> -
> -This function is only called from xmlStringLenDecodeEntities and
> -entities are replaced in a separate step immediately after the function
> -call.
> -
> -This bug could also be triggered with an internal subset and double
> -entity expansion.
> -
> -This fixes bug 766956 initially reported by Wei Lei and independently by
> -Chromium's ClusterFuzz, Hanno B=C3=B6ck, and Marco Grassi. Thanks to eve=
ryone
> -involved.
> -
> -xmlParseNameComplex with XML_PARSE_OLD10
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -When parsing Names inside an expanded parameter entity with the
> -XML_PARSE_OLD10 option, xmlParseNameComplex would call xmlGROW via the
> -GROW macro if the input buffer was exhausted. At the end of the
> -parameter entity's replacement text, this function would then call
> -xmlPopInput which invalidated the input buffer.
> -
> -There should be no need to invoke GROW in this situation because the
> -buffer is grown periodically every XML_PARSER_CHUNK_SIZE characters and,
> -at least for UTF-8, in xmlCurrentChar. This also matches the code path
> -executed when XML_PARSE_OLD10 is not set.
> -
> -This fixes bugs 781205 (CVE-2017-9049) and 781361 (CVE-2017-9050).
> -Thanks to Marcel B=C3=B6hme and Thuan Pham for the report.
> -
> -Additional hardening
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -A separate check was added in xmlParseNameComplex to validate the
> -buffer size.
> -
> -Fixes bug 781205 and bug 781361
> -
> -Upstream-Status: Backport [https://git.gnome.org/browse/
> libxml2/commit/?id=3D932cc9896ab41475d4aa429c27d9afd175959d74]
> -CVE: CVE-2017-9049 CVE-2017-9050
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 9f988b0..dab15a4 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -422,6 +422,24 @@ Errtests : xmllint$(EXEEXT)
> -             if [ -n "$$log" ] ; then echo $$name result ; echo $$log ;
> fi ; \
> -             rm result.$$name error.$$name ; \
> -         fi ; fi ; done)
> -+      @echo "## Error cases regression tests (old 1.0)"
> -+      -@(for i in $(srcdir)/test/errors10/*.xml ; do \
> -+        name=3D`basename $$i`; \
> -+        if [ ! -d $$i ] ; then \
> -+        if [ ! -f $(srcdir)/result/errors10/$$name ] ; then \
> -+            echo New test file $$name ; \
> -+            $(CHECKER) $(top_builddir)/xmllint --oldxml10 $$i \
> -+               2> $(srcdir)/result/errors10/$$name.err \
> -+               > $(srcdir)/result/errors10/$$name ; \
> -+            grep "MORY ALLO" .memdump  | grep -v "MEMORY ALLOCATED : 0"=
;
> \
> -+        else \
> -+            log=3D`$(CHECKER) $(top_builddir)/xmllint --oldxml10 $$i 2>
> error.$$name > result.$$name ; \
> -+            grep "MORY ALLO" .memdump  | grep -v "MEMORY ALLOCATED : 0"=
;
> \
> -+            diff $(srcdir)/result/errors10/$$name result.$$name ; \
> -+            diff $(srcdir)/result/errors10/$$name.err error.$$name` ; \
> -+            if [ -n "$$log" ] ; then echo $$name result ; echo "$$log" =
;
> fi ; \
> -+            rm result.$$name error.$$name ; \
> -+        fi ; fi ; done)
> -       @echo "## Error cases stream regression tests"
> -       -@(for i in $(srcdir)/test/errors/*.xml ; do \
> -         name=3D`basename $$i`; \
> -diff --git a/parser.c b/parser.c
> -index 609a270..8e11c12 100644
> ---- a/parser.c
> -+++ b/parser.c
> -@@ -2115,7 +2115,6 @@ static void xmlGROW (xmlParserCtxtPtr ctxt) {
> -       ctxt->input->line++; ctxt->input->col =3D 1;                     =
 \
> -     } else ctxt->input->col++;
>       \
> -     ctxt->input->cur +=3D l;                            \
> --    if (*ctxt->input->cur =3D=3D '%') xmlParserHandlePEReference(ctxt);=
   \
> -   } while (0)
> -
> - #define CUR_CHAR(l) xmlCurrentChar(ctxt, &l)
> -@@ -3406,13 +3405,6 @@ xmlParseNameComplex(xmlParserCtxtPtr ctxt) {
> -           len +=3D l;
> -           NEXTL(l);
> -           c =3D CUR_CHAR(l);
> --          if (c =3D=3D 0) {
> --              count =3D 0;
> --              GROW;
> --                if (ctxt->instate =3D=3D XML_PARSER_EOF)
> --                    return(NULL);
> --              c =3D CUR_CHAR(l);
> --          }
> -       }
> -     }
> -     if ((len > XML_MAX_NAME_LENGTH) &&
> -@@ -3420,6 +3412,16 @@ xmlParseNameComplex(xmlParserCtxtPtr ctxt) {
> -         xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "Name");
> -         return(NULL);
> -     }
> -+    if (ctxt->input->cur - ctxt->input->base < len) {
> -+        /*
> -+         * There were a couple of bugs where PERefs lead to to a change
> -+         * of the buffer. Check the buffer size to avoid passing an
> invalid
> -+         * pointer to xmlDictLookup.
> -+         */
> -+        xmlFatalErr(ctxt, XML_ERR_INTERNAL_ERROR,
> -+                    "unexpected change of input buffer");
> -+        return (NULL);
> -+    }
> -     if ((*ctxt->input->cur =3D=3D '\n') && (ctxt->input->cur[-1] =3D=3D=
 '\r'))
> -         return(xmlDictLookup(ctxt->dict, ctxt->input->cur - (len + 1),
> len));
> -     return(xmlDictLookup(ctxt->dict, ctxt->input->cur - len, len));
> -diff --git a/result/errors10/781205.xml b/result/errors10/781205.xml
> -new file mode 100644
> -index 0000000..e69de29
> -diff --git a/result/errors10/781205.xml.err b/result/errors10/781205.xml=
.
> err
> -new file mode 100644
> -index 0000000..da15c3f
> ---- /dev/null
> -+++ b/result/errors10/781205.xml.err
> -@@ -0,0 +1,21 @@
> -+Entity: line 1: parser error : internal error: xmlParseInternalSubset:
> error detected in Markup declaration
> -+
> -+ %a;
> -+    ^
> -+Entity: line 1:
> -+<:0000
> -+^
> -+Entity: line 1: parser error : DOCTYPE improperly terminated
> -+ %a;
> -+    ^
> -+Entity: line 1:
> -+<:0000
> -+^
> -+namespace error : Failed to parse QName ':0000'
> -+ %a;
> -+    ^
> -+<:0000
> -+      ^
> -+./test/errors10/781205.xml:4: parser error : Couldn't find end of Start
> Tag :0000 line 1
> -+
> -+^
> -diff --git a/result/errors10/781361.xml b/result/errors10/781361.xml
> -new file mode 100644
> -index 0000000..e69de29
> -diff --git a/result/errors10/781361.xml.err b/result/errors10/781361.xml=
.
> err
> -new file mode 100644
> -index 0000000..655f41a
> ---- /dev/null
> -+++ b/result/errors10/781361.xml.err
> -@@ -0,0 +1,13 @@
> -+./test/errors10/781361.xml:4: parser error : xmlParseElementDecl:
> 'EMPTY', 'ANY' or '(' expected
> -+
> -+^
> -+./test/errors10/781361.xml:4: parser error : internal error:
> xmlParseInternalSubset: error detected in Markup declaration
> -+
> -+
> -+^
> -+./test/errors10/781361.xml:4: parser error : DOCTYPE improperly
> terminated
> -+
> -+^
> -+./test/errors10/781361.xml:4: parser error : Start tag expected, '<'
> not found
> -+
> -+^
> -diff --git a/result/valid/766956.xml b/result/valid/766956.xml
> -new file mode 100644
> -index 0000000..e69de29
> -diff --git a/result/valid/766956.xml.err b/result/valid/766956.xml.err
> -new file mode 100644
> -index 0000000..34b1dae
> ---- /dev/null
> -+++ b/result/valid/766956.xml.err
> -@@ -0,0 +1,9 @@
> -+test/valid/dtds/766956.dtd:2: parser error : PEReference: expecting ';'
> -+%=C3=A4%ent;
> -+   ^
> -+Entity: line 1: parser error : Content error in the external subset
> -+ %ent;
> -+      ^
> -+Entity: line 1:
> -+value
> -+^
> -diff --git a/result/valid/766956.xml.err.rdr
> b/result/valid/766956.xml.err.rdr
> -new file mode 100644
> -index 0000000..7760346
> ---- /dev/null
> -+++ b/result/valid/766956.xml.err.rdr
> -@@ -0,0 +1,10 @@
> -+test/valid/dtds/766956.dtd:2: parser error : PEReference: expecting ';'
> -+%=C3=A4%ent;
> -+   ^
> -+Entity: line 1: parser error : Content error in the external subset
> -+ %ent;
> -+      ^
> -+Entity: line 1:
> -+value
> -+^
> -+./test/valid/766956.xml : failed to parse
> -diff --git a/runtest.c b/runtest.c
> -index bb74d2a..63e8c20 100644
> ---- a/runtest.c
> -+++ b/runtest.c
> -@@ -4202,6 +4202,9 @@ testDesc testDescriptions[] =3D {
> -     { "Error cases regression tests",
> -       errParseTest, "./test/errors/*.xml", "result/errors/", "", ".err"=
,
> -       0 },
> -+    { "Error cases regression tests (old 1.0)",
> -+      errParseTest, "./test/errors10/*.xml", "result/errors10/", "",
> ".err",
> -+      XML_PARSE_OLD10 },
> - #ifdef LIBXML_READER_ENABLED
> -     { "Error cases stream regression tests",
> -       streamParseTest, "./test/errors/*.xml", "result/errors/", NULL,
> ".str",
> -diff --git a/test/errors10/781205.xml b/test/errors10/781205.xml
> -new file mode 100644
> -index 0000000..d9e9e83
> ---- /dev/null
> -+++ b/test/errors10/781205.xml
> -@@ -0,0 +1,3 @@
> -+<!DOCTYPE D [
> -+  <!ENTITY % a "<:0000">
> -+  %a;
> -diff --git a/test/errors10/781361.xml b/test/errors10/781361.xml
> -new file mode 100644
> -index 0000000..67476bc
> ---- /dev/null
> -+++ b/test/errors10/781361.xml
> -@@ -0,0 +1,3 @@
> -+<!DOCTYPE doc [
> -+  <!ENTITY % elem "<!ELEMENT e0000000000">
> -+  %elem;
> -diff --git a/test/valid/766956.xml b/test/valid/766956.xml
> -new file mode 100644
> -index 0000000..19a95a0
> ---- /dev/null
> -+++ b/test/valid/766956.xml
> -@@ -0,0 +1,2 @@
> -+<!DOCTYPE test SYSTEM "dtds/766956.dtd">
> -+<test/>
> -diff --git a/test/valid/dtds/766956.dtd b/test/valid/dtds/766956.dtd
> -new file mode 100644
> -index 0000000..dddde68
> ---- /dev/null
> -+++ b/test/valid/dtds/766956.dtd
> -@@ -0,0 +1,2 @@
> -+<!ENTITY % ent "value">
> -+%=C3=A4%ent;
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_de=
refs.patch
> b/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch
> deleted file mode 100644
> index c60e32f..0000000
> --- a/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_
> pointer_derefs.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -libxml2-2.9.4: Fix more NULL pointer derefs
> -
> -xpointer: Fix more NULL pointer derefs
> -
> -Upstream-Status: Backport [https://git.gnome.org/browse/
> libxml2/commit/?id=3De905f08123e4a6e7731549e6f09dadff4cab65bd]
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> -
> -diff --git a/xpointer.c b/xpointer.c
> -index 676c510..074db24 100644
> ---- a/xpointer.c
> -+++ b/xpointer.c
> -@@ -555,7 +555,7 @@ xmlXPtrNewRangeNodeObject(xmlNodePtr start,
> xmlXPathObjectPtr end) {
> -           /*
> -            * Empty set ...
> -            */
> --          if (end->nodesetval->nodeNr <=3D 0)
> -+          if ((end->nodesetval =3D=3D NULL) || (end->nodesetval->nodeNr=
 <=3D
> 0))
> -               return(NULL);
> -           break;
> -       default:
> -@@ -1400,7 +1400,7 @@ xmlXPtrEval(const xmlChar *str, xmlXPathContextPtr
> ctx) {
> -                    */
> -                   xmlNodeSetPtr set;
> -                   set =3D tmp->nodesetval;
> --                  if ((set->nodeNr !=3D 1) ||
> -+                  if ((set =3D=3D NULL) || (set->nodeNr !=3D 1) ||
> -                       (set->nodeTab[0] !=3D (xmlNodePtr) ctx->doc))
> -                       stack++;
> -               } else
> -@@ -2073,9 +2073,11 @@ xmlXPtrRangeFunction(xmlXPathParserContextPtr
> ctxt, int nargs) {
> -       xmlXPathFreeObject(set);
> -         XP_ERROR(XPATH_MEMORY_ERROR);
> -     }
> --    for (i =3D 0;i < oldset->locNr;i++) {
> --      xmlXPtrLocationSetAdd(newset,
> --              xmlXPtrCoveringRange(ctxt, oldset->locTab[i]));
> -+    if (oldset !=3D NULL) {
> -+      for (i =3D 0;i < oldset->locNr;i++) {
> -+        xmlXPtrLocationSetAdd(newset,
> -+                xmlXPtrCoveringRange(ctxt, oldset->locTab[i]));
> -+      }
> -     }
> -
> -     /*
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix_and_
> simplify_xmlParseStartTag2.patch b/meta/recipes-core/libxml/
> libxml2/libxml2-fix_and_simplify_xmlParseStartTag2.patch
> deleted file mode 100644
> index faa5770..0000000
> --- a/meta/recipes-core/libxml/libxml2/libxml2-fix_and_
> simplify_xmlParseStartTag2.patch
> +++ /dev/null
> @@ -1,590 +0,0 @@
> -libxml2-2.9.4: Avoid reparsing and simplify control flow in
> xmlParseStartTag2
> -
> -[No upstream tracking]
> -
> -parser: Avoid reparsing in xmlParseStartTag2
> -
> -The code in xmlParseStartTag2 must handle the case that the input
> -buffer was grown and reallocated which can invalidate pointers to
> -attribute values. Before, this was handled by detecting changes of
> -the input buffer "base" pointer and, in case of a change, jumping
> -back to the beginning of the function and reparsing the start tag.
> -
> -The major problem of this approach is that whether an input buffer is
> -reallocated is nondeterministic, resulting in seemingly random test
> -failures. See the mailing list thread "runtest mystery bug: name2.xml
> -error case regression test" from 2012, for example.
> -
> -If a reallocation was detected, the code also made no attempts to
> -continue parsing in case of errors which makes a difference in
> -the lax "recover" mode.
> -
> -Now we store the current input buffer "base" pointer for each (not
> -separately allocated) attribute in the namespace URI field, which isn't
> -used until later. After the whole start tag was parsed, the pointers to
> -the attribute values are reconstructed using the offset between the
> -new and the old input buffer. This relies on arithmetic on dangling
> -pointers which is technically undefined behavior. But it seems like
> -the easiest and most efficient fix and a similar approach is used in
> -xmlParserInputGrow.
> -
> -This changes the error output of several tests, typically making it
> -more verbose because we try harder to continue parsing in case of errors=
.
> -
> -(Another possible solution is to check not only the "base" pointer
> -but the size of the input buffer as well. But this would result in
> -even more reparsing.)
> -
> -Remove some goto labels and deduplicate a bit of code after handling
> -namespaces.
> -
> -There were two bugs where parameter-entity references could lead to an
> -unexpected change of the input buffer in xmlParseNameComplex and
> -xmlDictLookup being called with an invalid pointer.
> -
> -
> -Upstream-Status: Backport
> - - [https://git.gnome.org/browse/libxml2/commit/?id=3D
> 07b7428b69c368611d215a140fe630b2d1e61349]
> - - [https://git.gnome.org/browse/libxml2/commit/?id=3D
> 855c19efb7cd30d927d673b3658563c4959ca6f0]
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -
> -diff --git a/parser.c b/parser.c
> -index 609a270..74016e3 100644
> ---- a/parser.c
> -+++ b/parser.c
> -@@ -43,6 +43,7 @@
> - #include <limits.h>
> - #include <string.h>
> - #include <stdarg.h>
> -+#include <stddef.h>
> - #include <libxml/xmlmemory.h>
> - #include <libxml/threads.h>
> - #include <libxml/globals.h>
> -@@ -9377,8 +9378,7 @@ xmlParseStartTag2(xmlParserCtxtPtr ctxt, const
> xmlChar **pref,
> -     const xmlChar **atts =3D ctxt->atts;
> -     int maxatts =3D ctxt->maxatts;
> -     int nratts, nbatts, nbdef;
> --    int i, j, nbNs, attval, oldline, oldcol, inputNr;
> --    const xmlChar *base;
> -+    int i, j, nbNs, attval;
> -     unsigned long cur;
> -     int nsNr =3D ctxt->nsNr;
> -
> -@@ -9392,13 +9392,8 @@ xmlParseStartTag2(xmlParserCtxtPtr ctxt, const
> xmlChar **pref,
> -      *       The Shrinking is only possible once the full set of
> attribute
> -      *       callbacks have been done.
> -      */
> --reparse:
> -     SHRINK;
> --    base =3D ctxt->input->base;
> -     cur =3D ctxt->input->cur - ctxt->input->base;
> --    inputNr =3D ctxt->inputNr;
> --    oldline =3D ctxt->input->line;
> --    oldcol =3D ctxt->input->col;
> -     nbatts =3D 0;
> -     nratts =3D 0;
> -     nbdef =3D 0;
> -@@ -9422,8 +9417,6 @@ reparse:
> -      */
> -     SKIP_BLANKS;
> -     GROW;
> --    if ((ctxt->input->base !=3D base) || (inputNr !=3D ctxt->inputNr))
> --        goto base_changed;
> -
> -     while (((RAW !=3D '>') &&
> -          ((RAW !=3D '/') || (NXT(1) !=3D '>')) &&
> -@@ -9434,203 +9427,174 @@ reparse:
> -
> -       attname =3D xmlParseAttribute2(ctxt, prefix, localname,
> -                                    &aprefix, &attvalue, &len, &alloc);
> --      if ((ctxt->input->base !=3D base) || (inputNr !=3D ctxt->inputNr)=
) {
> --          if ((attvalue !=3D NULL) && (alloc !=3D 0))
> --              xmlFree(attvalue);
> --          attvalue =3D NULL;
> --          goto base_changed;
> --      }
> --        if ((attname !=3D NULL) && (attvalue !=3D NULL)) {
> --          if (len < 0) len =3D xmlStrlen(attvalue);
> --            if ((attname =3D=3D ctxt->str_xmlns) && (aprefix =3D=3D NUL=
L)) {
> --              const xmlChar *URL =3D xmlDictLookup(ctxt->dict, attvalue=
,
> len);
> --              xmlURIPtr uri;
> --
> --                if (URL =3D=3D NULL) {
> --                  xmlErrMemory(ctxt, "dictionary allocation failure");
> --                  if ((attvalue !=3D NULL) && (alloc !=3D 0))
> --                      xmlFree(attvalue);
> --                  return(NULL);
> --              }
> --                if (*URL !=3D 0) {
> --                  uri =3D xmlParseURI((const char *) URL);
> --                  if (uri =3D=3D NULL) {
> --                      xmlNsErr(ctxt, XML_WAR_NS_URI,
> --                               "xmlns: '%s' is not a valid URI\n",
> --                                         URL, NULL, NULL);
> --                  } else {
> --                      if (uri->scheme =3D=3D NULL) {
> --                          xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,
> --                                    "xmlns: URI %s is not absolute\n",
> --                                    URL, NULL, NULL);
> --                      }
> --                      xmlFreeURI(uri);
> --                  }
> --                  if (URL =3D=3D ctxt->str_xml_ns) {
> --                      if (attname !=3D ctxt->str_xml) {
> --                          xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> --                       "xml namespace URI cannot be the default
> namespace\n",
> --                                   NULL, NULL, NULL);
> --                      }
> --                      goto skip_default_ns;
> --                  }
> --                  if ((len =3D=3D 29) &&
> --                      (xmlStrEqual(URL,
> --                               BAD_CAST "http://www.w3.org/2000/xmlns/"=
)))
> {
> --                      xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> --                           "reuse of the xmlns namespace name is
> forbidden\n",
> --                               NULL, NULL, NULL);
> --                      goto skip_default_ns;
> --                  }
> --              }
> --              /*
> --               * check that it's not a defined namespace
> --               */
> --              for (j =3D 1;j <=3D nbNs;j++)
> --                  if (ctxt->nsTab[ctxt->nsNr - 2 * j] =3D=3D NULL)
> --                      break;
> --              if (j <=3D nbNs)
> --                  xmlErrAttributeDup(ctxt, NULL, attname);
> --              else
> --                  if (nsPush(ctxt, NULL, URL) > 0) nbNs++;
> --skip_default_ns:
> --              if ((attvalue !=3D NULL) && (alloc !=3D 0)) {
> --                  xmlFree(attvalue);
> --                  attvalue =3D NULL;
> --              }
> --              if ((RAW =3D=3D '>') || (((RAW =3D=3D '/') && (NXT(1) =3D=
=3D '>'))))
> --                  break;
> --              if (!IS_BLANK_CH(RAW)) {
> --                  xmlFatalErrMsg(ctxt, XML_ERR_SPACE_REQUIRED,
> --                                 "attributes construct error\n");
> --                  break;
> --              }
> --              SKIP_BLANKS;
> --              if ((ctxt->input->base !=3D base) || (inputNr !=3D
> ctxt->inputNr))
> --                  goto base_changed;
> --              continue;
> --          }
> --            if (aprefix =3D=3D ctxt->str_xmlns) {
> --              const xmlChar *URL =3D xmlDictLookup(ctxt->dict, attvalue=
,
> len);
> --              xmlURIPtr uri;
> --
> --                if (attname =3D=3D ctxt->str_xml) {
> --                  if (URL !=3D ctxt->str_xml_ns) {
> --                      xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> --                               "xml namespace prefix mapped to wrong
> URI\n",
> --                               NULL, NULL, NULL);
> --                  }
> --                  /*
> --                   * Do not keep a namespace definition node
> --                   */
> --                  goto skip_ns;
> --              }
> -+        if ((attname =3D=3D NULL) || (attvalue =3D=3D NULL))
> -+            goto next_attr;
> -+      if (len < 0) len =3D xmlStrlen(attvalue);
> -+
> -+        if ((attname =3D=3D ctxt->str_xmlns) && (aprefix =3D=3D NULL)) =
{
> -+            const xmlChar *URL =3D xmlDictLookup(ctxt->dict, attvalue,
> len);
> -+            xmlURIPtr uri;
> -+
> -+            if (URL =3D=3D NULL) {
> -+                xmlErrMemory(ctxt, "dictionary allocation failure");
> -+                if ((attvalue !=3D NULL) && (alloc !=3D 0))
> -+                    xmlFree(attvalue);
> -+                return(NULL);
> -+            }
> -+            if (*URL !=3D 0) {
> -+                uri =3D xmlParseURI((const char *) URL);
> -+                if (uri =3D=3D NULL) {
> -+                    xmlNsErr(ctxt, XML_WAR_NS_URI,
> -+                             "xmlns: '%s' is not a valid URI\n",
> -+                                       URL, NULL, NULL);
> -+                } else {
> -+                    if (uri->scheme =3D=3D NULL) {
> -+                        xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,
> -+                                  "xmlns: URI %s is not absolute\n",
> -+                                  URL, NULL, NULL);
> -+                    }
> -+                    xmlFreeURI(uri);
> -+                }
> -                 if (URL =3D=3D ctxt->str_xml_ns) {
> --                  if (attname !=3D ctxt->str_xml) {
> --                      xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> --                               "xml namespace URI mapped to wrong
> prefix\n",
> --                               NULL, NULL, NULL);
> --                  }
> --                  goto skip_ns;
> --              }
> --                if (attname =3D=3D ctxt->str_xmlns) {
> --                  xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> --                           "redefinition of the xmlns prefix is
> forbidden\n",
> --                           NULL, NULL, NULL);
> --                  goto skip_ns;
> --              }
> --              if ((len =3D=3D 29) &&
> --                  (xmlStrEqual(URL,
> --                               BAD_CAST "http://www.w3.org/2000/xmlns/"=
)))
> {
> --                  xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> --                           "reuse of the xmlns namespace name is
> forbidden\n",
> --                           NULL, NULL, NULL);
> --                  goto skip_ns;
> --              }
> --              if ((URL =3D=3D NULL) || (URL[0] =3D=3D 0)) {
> --                  xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> --                           "xmlns:%s: Empty XML namespace is not
> allowed\n",
> --                                attname, NULL, NULL);
> --                  goto skip_ns;
> --              } else {
> --                  uri =3D xmlParseURI((const char *) URL);
> --                  if (uri =3D=3D NULL) {
> --                      xmlNsErr(ctxt, XML_WAR_NS_URI,
> --                           "xmlns:%s: '%s' is not a valid URI\n",
> --                                         attname, URL, NULL);
> --                  } else {
> --                      if ((ctxt->pedantic) && (uri->scheme =3D=3D NULL)=
) {
> --                          xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,
> --                                    "xmlns:%s: URI %s is not absolute\n=
",
> --                                    attname, URL, NULL);
> --                      }
> --                      xmlFreeURI(uri);
> --                  }
> --              }
> --
> --              /*
> --               * check that it's not a defined namespace
> --               */
> --              for (j =3D 1;j <=3D nbNs;j++)
> --                  if (ctxt->nsTab[ctxt->nsNr - 2 * j] =3D=3D attname)
> --                      break;
> --              if (j <=3D nbNs)
> --                  xmlErrAttributeDup(ctxt, aprefix, attname);
> --              else
> --                  if (nsPush(ctxt, attname, URL) > 0) nbNs++;
> --skip_ns:
> --              if ((attvalue !=3D NULL) && (alloc !=3D 0)) {
> --                  xmlFree(attvalue);
> --                  attvalue =3D NULL;
> --              }
> --              if ((RAW =3D=3D '>') || (((RAW =3D=3D '/') && (NXT(1) =3D=
=3D '>'))))
> --                  break;
> --              if (!IS_BLANK_CH(RAW)) {
> --                  xmlFatalErrMsg(ctxt, XML_ERR_SPACE_REQUIRED,
> --                                 "attributes construct error\n");
> --                  break;
> --              }
> --              SKIP_BLANKS;
> --              if ((ctxt->input->base !=3D base) || (inputNr !=3D
> ctxt->inputNr))
> --                  goto base_changed;
> --              continue;
> --          }
> -+                    if (attname !=3D ctxt->str_xml) {
> -+                        xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> -+                     "xml namespace URI cannot be the default
> namespace\n",
> -+                                 NULL, NULL, NULL);
> -+                    }
> -+                    goto next_attr;
> -+                }
> -+                if ((len =3D=3D 29) &&
> -+                    (xmlStrEqual(URL,
> -+                             BAD_CAST "http://www.w3.org/2000/xmlns/"))=
)
> {
> -+                    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> -+                         "reuse of the xmlns namespace name is
> forbidden\n",
> -+                             NULL, NULL, NULL);
> -+                    goto next_attr;
> -+                }
> -+            }
> -+            /*
> -+             * check that it's not a defined namespace
> -+             */
> -+            for (j =3D 1;j <=3D nbNs;j++)
> -+                if (ctxt->nsTab[ctxt->nsNr - 2 * j] =3D=3D NULL)
> -+                    break;
> -+            if (j <=3D nbNs)
> -+                xmlErrAttributeDup(ctxt, NULL, attname);
> -+            else
> -+                if (nsPush(ctxt, NULL, URL) > 0) nbNs++;
> -+
> -+        } else if (aprefix =3D=3D ctxt->str_xmlns) {
> -+            const xmlChar *URL =3D xmlDictLookup(ctxt->dict, attvalue,
> len);
> -+            xmlURIPtr uri;
> -+
> -+            if (attname =3D=3D ctxt->str_xml) {
> -+                if (URL !=3D ctxt->str_xml_ns) {
> -+                    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> -+                             "xml namespace prefix mapped to wrong
> URI\n",
> -+                             NULL, NULL, NULL);
> -+                }
> -+                /*
> -+                 * Do not keep a namespace definition node
> -+                 */
> -+                goto next_attr;
> -+            }
> -+            if (URL =3D=3D ctxt->str_xml_ns) {
> -+                if (attname !=3D ctxt->str_xml) {
> -+                    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> -+                             "xml namespace URI mapped to wrong
> prefix\n",
> -+                             NULL, NULL, NULL);
> -+                }
> -+                goto next_attr;
> -+            }
> -+            if (attname =3D=3D ctxt->str_xmlns) {
> -+                xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> -+                         "redefinition of the xmlns prefix is
> forbidden\n",
> -+                         NULL, NULL, NULL);
> -+                goto next_attr;
> -+            }
> -+            if ((len =3D=3D 29) &&
> -+                (xmlStrEqual(URL,
> -+                             BAD_CAST "http://www.w3.org/2000/xmlns/"))=
)
> {
> -+                xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> -+                         "reuse of the xmlns namespace name is
> forbidden\n",
> -+                         NULL, NULL, NULL);
> -+                goto next_attr;
> -+            }
> -+            if ((URL =3D=3D NULL) || (URL[0] =3D=3D 0)) {
> -+                xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> -+                         "xmlns:%s: Empty XML namespace is not
> allowed\n",
> -+                              attname, NULL, NULL);
> -+                goto next_attr;
> -+            } else {
> -+                uri =3D xmlParseURI((const char *) URL);
> -+                if (uri =3D=3D NULL) {
> -+                    xmlNsErr(ctxt, XML_WAR_NS_URI,
> -+                         "xmlns:%s: '%s' is not a valid URI\n",
> -+                                       attname, URL, NULL);
> -+                } else {
> -+                    if ((ctxt->pedantic) && (uri->scheme =3D=3D NULL)) =
{
> -+                        xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,
> -+                                  "xmlns:%s: URI %s is not absolute\n",
> -+                                  attname, URL, NULL);
> -+                    }
> -+                    xmlFreeURI(uri);
> -+                }
> -+            }
> -
> --          /*
> --           * Add the pair to atts
> --           */
> --          if ((atts =3D=3D NULL) || (nbatts + 5 > maxatts)) {
> --              if (xmlCtxtGrowAttrs(ctxt, nbatts + 5) < 0) {
> --                  if (attvalue[len] =3D=3D 0)
> --                      xmlFree(attvalue);
> --                  goto failed;
> --              }
> --              maxatts =3D ctxt->maxatts;
> --              atts =3D ctxt->atts;
> --          }
> --          ctxt->attallocs[nratts++] =3D alloc;
> --          atts[nbatts++] =3D attname;
> --          atts[nbatts++] =3D aprefix;
> --          atts[nbatts++] =3D NULL; /* the URI will be fetched later */
> --          atts[nbatts++] =3D attvalue;
> --          attvalue +=3D len;
> --          atts[nbatts++] =3D attvalue;
> --          /*
> --           * tag if some deallocation is needed
> --           */
> --          if (alloc !=3D 0) attval =3D 1;
> --      } else {
> --          if ((attvalue !=3D NULL) && (attvalue[len] =3D=3D 0))
> --              xmlFree(attvalue);
> --      }
> -+            /*
> -+             * check that it's not a defined namespace
> -+             */
> -+            for (j =3D 1;j <=3D nbNs;j++)
> -+                if (ctxt->nsTab[ctxt->nsNr - 2 * j] =3D=3D attname)
> -+                    break;
> -+            if (j <=3D nbNs)
> -+                xmlErrAttributeDup(ctxt, aprefix, attname);
> -+            else
> -+                if (nsPush(ctxt, attname, URL) > 0) nbNs++;
> -+
> -+        } else {
> -+            /*
> -+             * Add the pair to atts
> -+             */
> -+            if ((atts =3D=3D NULL) || (nbatts + 5 > maxatts)) {
> -+                if (xmlCtxtGrowAttrs(ctxt, nbatts + 5) < 0) {
> -+                    goto next_attr;
> -+                }
> -+                maxatts =3D ctxt->maxatts;
> -+                atts =3D ctxt->atts;
> -+            }
> -+            ctxt->attallocs[nratts++] =3D alloc;
> -+            atts[nbatts++] =3D attname;
> -+            atts[nbatts++] =3D aprefix;
> -+            /*
> -+             * The namespace URI field is used temporarily to point at
> the
> -+             * base of the current input buffer for non-alloced
> attributes.
> -+             * When the input buffer is reallocated, all the pointers
> become
> -+             * invalid, but they can be reconstructed later.
> -+             */
> -+            if (alloc)
> -+                atts[nbatts++] =3D NULL;
> -+            else
> -+                atts[nbatts++] =3D ctxt->input->base;
> -+            atts[nbatts++] =3D attvalue;
> -+            attvalue +=3D len;
> -+            atts[nbatts++] =3D attvalue;
> -+            /*
> -+             * tag if some deallocation is needed
> -+             */
> -+            if (alloc !=3D 0) attval =3D 1;
> -+            attvalue =3D NULL; /* moved into atts */
> -+        }
> -
> --failed:
> -+next_attr:
> -+        if ((attvalue !=3D NULL) && (alloc !=3D 0)) {
> -+            xmlFree(attvalue);
> -+            attvalue =3D NULL;
> -+        }
> -
> -       GROW
> -         if (ctxt->instate =3D=3D XML_PARSER_EOF)
> -             break;
> --      if ((ctxt->input->base !=3D base) || (inputNr !=3D ctxt->inputNr)=
)
> --          goto base_changed;
> -       if ((RAW =3D=3D '>') || (((RAW =3D=3D '/') && (NXT(1) =3D=3D '>')=
)))
> -           break;
> -       if (!IS_BLANK_CH(RAW)) {
> -@@ -9646,8 +9610,20 @@ failed:
> -           break;
> -       }
> -         GROW;
> --      if ((ctxt->input->base !=3D base) || (inputNr !=3D ctxt->inputNr)=
)
> --          goto base_changed;
> -+    }
> -+
> -+    /* Reconstruct attribute value pointers. */
> -+    for (i =3D 0, j =3D 0; j < nratts; i +=3D 5, j++) {
> -+        if (atts[i+2] !=3D NULL) {
> -+            /*
> -+             * Arithmetic on dangling pointers is technically undefined
> -+             * behavior, but well...
> -+             */
> -+            ptrdiff_t offset =3D ctxt->input->base - atts[i+2];
> -+            atts[i+2]  =3D NULL;    /* Reset repurposed namespace URI *=
/
> -+            atts[i+3] +=3D offset;  /* value */
> -+            atts[i+4] +=3D offset;  /* valuend */
> -+        }
> -     }
> -
> -     /*
> -@@ -9804,34 +9780,6 @@ failed:
> -     }
> -
> -     return(localname);
> --
> --base_changed:
> --    /*
> --     * the attribute strings are valid iif the base didn't changed
> --     */
> --    if (attval !=3D 0) {
> --      for (i =3D 3,j =3D 0; j < nratts;i +=3D 5,j++)
> --          if ((ctxt->attallocs[j] !=3D 0) && (atts[i] !=3D NULL))
> --              xmlFree((xmlChar *) atts[i]);
> --    }
> --
> --    /*
> --     * We can't switch from one entity to another in the middle
> --     * of a start tag
> --     */
> --    if (inputNr !=3D ctxt->inputNr) {
> --        xmlFatalErrMsg(ctxt, XML_ERR_ENTITY_BOUNDARY,
> --                  "Start tag doesn't start and stop in the same
> entity\n");
> --      return(NULL);
> --    }
> --
> --    ctxt->input->cur =3D ctxt->input->base + cur;
> --    ctxt->input->line =3D oldline;
> --    ctxt->input->col =3D oldcol;
> --    if (ctxt->wellFormed =3D=3D 1) {
> --      goto reparse;
> --    }
> --    return(NULL);
> - }
> -
> - /**
> -diff --git a/result/errors/759398.xml.err b/result/errors/759398.xml.err
> -index e08d9bf..f6036a3 100644
> ---- a/result/errors/759398.xml.err
> -+++ b/result/errors/759398.xml.err
> -@@ -1,9 +1,12 @@
> - ./test/errors/759398.xml:210: parser error : StartTag: invalid element
> name
> - need to worry about parsers whi<! don't expand PErefs finding
> -                                 ^
> --./test/errors/759398.xml:309: parser error : Opening and ending tag
> mismatch: spec line 50 and termdef
> -+./test/errors/759398.xml:309: parser error : Opening and ending tag
> mismatch: =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96!
>  =E2=84=96=E2=84=96=E2=84=96
>  =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=C3=A2!
>  =EF=BF=BD=EF=BF=BD=E2=84=96=E2=84=96=C3=A2
>  =EF=BF=BD=EF=BF=BD=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=EF=BF=BD=E2=80=9E!
>  =EF=BF=BD=E2=84=96=E2=84=96=EF=BF=BD=E2=80=9E
>  =EF=BF=BD=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96
> =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96m
> line 308 and termdef
> - and provide access to their content and structure.</termdef> <termdef
> -                                                             ^
> --./test/errors/759398.xml:309: parser error : Extra content at the end
> of the document
> --and provide access to their content and structure.</termdef> <termdef
> --                                                             ^
> -+./test/errors/759398.xml:314: parser error : Opening and ending tag
> mismatch: spec line 50 and p
> -+data and the information it must provide to the application.</p>
> -+                                                                ^
> -+./test/errors/759398.xml:316: parser error : Extra content at the end
> of the document
> -+<div2 id=3D'sec-origin-goals'>
> -+^
> -diff --git a/result/errors/attr1.xml.err b/result/errors/attr1.xml.err
> -index 4f08538..c4c4fc8 100644
> ---- a/result/errors/attr1.xml.err
> -+++ b/result/errors/attr1.xml.err
> -@@ -1,6 +1,9 @@
> - ./test/errors/attr1.xml:2: parser error : AttValue: ' expected
> -
> - ^
> --./test/errors/attr1.xml:1: parser error : Extra content at the end of
> the document
> --<foo foo=3D"ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=
o
> oooooooooo
> -- ^
> -+./test/errors/attr1.xml:2: parser error : attributes construct error
> -+
> -+^
> -+./test/errors/attr1.xml:2: parser error : Couldn't find end of Start Ta=
g
> foo line 1
> -+
> -+^
> -diff --git a/result/errors/attr2.xml.err b/result/errors/attr2.xml.err
> -index c8a9c7d..77e342e 100644
> ---- a/result/errors/attr2.xml.err
> -+++ b/result/errors/attr2.xml.err
> -@@ -1,6 +1,9 @@
> - ./test/errors/attr2.xml:2: parser error : AttValue: ' expected
> -
> - ^
> --./test/errors/attr2.xml:1: parser error : Extra content at the end of
> the document
> --<foo foo=3D">oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=
oo
> ooooooooo
> -- ^
> -+./test/errors/attr2.xml:2: parser error : attributes construct error
> -+
> -+^
> -+./test/errors/attr2.xml:2: parser error : Couldn't find end of Start Ta=
g
> foo line 1
> -+
> -+^
> -diff --git a/result/errors/name2.xml.err b/result/errors/name2.xml.err
> -index a6649a1..8a6acee 100644
> ---- a/result/errors/name2.xml.err
> -+++ b/result/errors/name2.xml.err
> -@@ -1,6 +1,9 @@
> - ./test/errors/name2.xml:2: parser error : Specification mandate value
> for attribute foooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=
o
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo!
>  ooooooooo
>  oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooo!
>  ooooooooo
>  oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooo!
>  ooooooooo
>  oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooo!
>  ooooooooo
>  oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooo!
>  ooooooooo
>  oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> ooooooooooooooooooooo
> -
> - ^
> --./test/errors/name2.xml:1: parser error : Extra content at the end of
> the document
> --<foo fooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> ooooooooooooooo
> -- ^
> -+./test/errors/name2.xml:2: parser error : attributes construct error
> -+
> -+^
> -+./test/errors/name2.xml:2: parser error : Couldn't find end of Start Ta=
g
> foo line 1
> -+
> -+^
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison=
.patch
> b/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
> deleted file mode 100644
> index 65f6bef..0000000
> --- a/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -libxml2-2.9.4: Fix comparison with root node in xmlXPathCmpNodes and NUL=
L
> pointer deref in XPointer
> -
> -xpath:
> - - Check for errors after evaluating first operand.
> - - Add sanity check for empty stack.
> - - Include comparation in changes from xmlXPathCmpNodesExt to
> xmlXPathCmpNodes
> -
> -Upstream-Status: Backport
> - - [https://git.gnome.org/browse/libxml2/commit/?id=3D
> c1d1f7121194036608bf555f08d3062a36fd344b]
> - - [https://git.gnome.org/browse/libxml2/commit/?id=3D
> a005199330b86dada19d162cae15ef9bdcb6baa8]
> -CVE: CVE-2016-5131
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> -
> -diff --git a/result/XPath/xptr/viderror b/result/XPath/xptr/viderror
> -new file mode 100644
> -index 0000000..d589882
> ---- /dev/null
> -+++ b/result/XPath/xptr/viderror
> -@@ -0,0 +1,4 @@
> -+
> -+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> -+Expression: xpointer(non-existing-fn()/range-to(id('chapter2')))
> -+Object is empty (NULL)
> -diff --git a/test/XPath/xptr/viderror b/test/XPath/xptr/viderror
> -new file mode 100644
> -index 0000000..da8c53b
> ---- /dev/null
> -+++ b/test/XPath/xptr/viderror
> -@@ -0,0 +1 @@
> -+xpointer(non-existing-fn()/range-to(id('chapter2')))
> -diff --git a/xpath.c b/xpath.c
> -index 113bce6..d992841 100644
> ---- a/xpath.c
> -+++ b/xpath.c
> -@@ -3342,13 +3342,13 @@ xmlXPathCmpNodes(xmlNodePtr node1, xmlNodePtr
> node2) {
> -      * compute depth to root
> -      */
> -     for (depth2 =3D 0, cur =3D node2;cur->parent !=3D NULL;cur =3D cur-=
>parent) {
> --      if (cur =3D=3D node1)
> -+      if (cur->parent =3D=3D node1)
> -           return(1);
> -       depth2++;
> -     }
> -     root =3D cur;
> -     for (depth1 =3D 0, cur =3D node1;cur->parent !=3D NULL;cur =3D cur-=
>parent) {
> --      if (cur =3D=3D node2)
> -+      if (cur->parent =3D=3D node2)
> -           return(-1);
> -       depth1++;
> -     }
> -@@ -14005,9 +14005,14 @@ xmlXPathCompOpEval(xmlXPathParserContextPtr
> ctxt, xmlXPathStepOpPtr op)
> -                 xmlNodeSetPtr oldset;
> -                 int i, j;
> -
> --                if (op->ch1 !=3D -1)
> -+                if (op->ch1 !=3D -1) {
> -                     total +=3D
> -                         xmlXPathCompOpEval(ctxt, &comp->steps[op->ch1])=
;
> -+                    CHECK_ERROR0;
> -+                }
> -+                if (ctxt->value =3D=3D NULL) {
> -+                    XP_ERROR0(XPATH_INVALID_OPERAND);
> -+                }
> -                 if (op->ch2 =3D=3D -1)
> -                     return (total);
> -
> diff --git a/meta/recipes-core/libxml/libxml2/runtest.patch
> b/meta/recipes-core/libxml/libxml2/runtest.patch
> index 6e56857..cb171d5 100644
> --- a/meta/recipes-core/libxml/libxml2/runtest.patch
> +++ b/meta/recipes-core/libxml/libxml2/runtest.patch
> @@ -2,47 +2,29 @@ Add 'install-ptest' rule.
>  Print a standard result line for each test.
>
>  Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> -Signed-off-by: Andrej Valek <andrej.valek@enea.com>
> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>  Upstream-Status: Backport
>
>  diff -uNr a/Makefile.am b/Makefile.am
> ---- a/Makefile.am      2016-05-22 03:49:02.000000000 +0200
> -+++ b/Makefile.am      2017-06-14 10:38:43.381305385 +0200
> -@@ -202,10 +202,24 @@
> +--- a/Makefile.am      2017-08-28 15:01:14.000000000 +0200
> ++++ b/Makefile.am      2017-09-05 08:06:05.752287323 +0200
> +@@ -202,6 +202,15 @@
>   #testOOM_DEPENDENCIES =3D $(DEPS)
>   #testOOM_LDADD=3D $(LDADDS)
>
>  +install-ptest:
>  +      @(if [ -d .libs ] ; then cd .libs; fi; \
> -+      install $(noinst_PROGRAMS) $(DESTDIR))
> ++      install $(check_PROGRAMS) $(DESTDIR))
>  +      cp -r $(srcdir)/test $(DESTDIR)
>  +      cp -r $(srcdir)/result $(DESTDIR)
>  +      cp -r $(srcdir)/python $(DESTDIR)
>  +      cp Makefile $(DESTDIR)
>  +      sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
>  +
> - runtests:
> + runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
> +           testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
>         [ -d test   ] || $(LN_S) $(srcdir)/test   .
> -       [ -d result ] || $(LN_S) $(srcdir)/result .
> --      $(CHECKER) ./runtest$(EXEEXT) && $(CHECKER) ./testrecurse$(EXEEXT=
)
> &&$(CHECKER) ./testapi$(EXEEXT) && $(CHECKER) ./testchar$(EXEEXT)&&
> $(CHECKER) ./testdict$(EXEEXT) && $(CHECKER) ./runxmlconf$(EXEEXT)
> -+      $(CHECKER) ./runtest$(EXEEXT) && \
> -+          $(CHECKER) ./testrecurse$(EXEEXT) && \
> -+          ASAN_OPTIONS=3D"$$ASAN_OPTIONS:detect_leaks=3D0" $(CHECKER)
> ./testapi$(EXEEXT) && \
> -+          $(CHECKER) ./testchar$(EXEEXT) && \
> -+          $(CHECKER) ./testdict$(EXEEXT) && \
> -+          $(CHECKER) ./runxmlconf$(EXEEXT)
> -       @(if [ "$(PYTHON_SUBDIR)" !=3D "" ] ; then cd python ; \
> -           $(MAKE) tests ; fi)
> -
> -@@ -229,7 +243,7 @@
> -
> - APItests: testapi$(EXEEXT)
> -       @echo "## Running the API regression tests this may take a little
> while"
> --      -@($(CHECKER) $(top_builddir)/testapi -q)
> -+      -@(ASAN_OPTIONS=3D"$$ASAN_OPTIONS:detect_leaks=3D0" $(CHECKER)
> $(top_builddir)/testapi -q)
> -
> - HTMLtests : testHTML$(EXEEXT)
> -       @(echo > .memdump)
> +
>  diff -uNr a/runsuite.c b/runsuite.c
>  --- a/runsuite.c       2013-04-12 16:17:11.462823238 +0200
>  +++ b/runsuite.c       2013-04-17 14:07:24.352693211 +0200
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb
> b/meta/recipes-core/libxml/libxml2_2.9.5.bb
> similarity index 85%
> rename from meta/recipes-core/libxml/libxml2_2.9.4.bb
> rename to meta/recipes-core/libxml/libxml2_2.9.5.bb
> index 107539b..16391c3 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.5.bb
> @@ -19,21 +19,11 @@ SRC_URI =3D "ftp://xmlsoft.org/libxml2/
> libxml2-${PV}.tar.gz;name=3Dlibtar \
>             file://run-ptest \
>             file://python-sitepackages-dir.patch \
>             file://libxml-m4-use-pkgconfig.patch \
> -           file://libxml2-fix_node_comparison.patch \
> -           file://libxml2-CVE-2016-5131.patch \
> -           file://libxml2-CVE-2016-4658.patch \
> -           file://libxml2-fix_NULL_pointer_derefs.patch \
> -           file://libxml2-fix_and_simplify_xmlParseStartTag2.patch \
> -           file://libxml2-CVE-2017-9047_CVE-2017-9048.patch \
> -           file://libxml2-CVE-2017-9049_CVE-2017-9050.patch \
> -           file://libxml2-CVE-2017-5969.patch \
> -           file://libxml2-CVE-2017-0663.patch \
> -           file://libxml2-CVE-2017-8872.patch \
>             file://0001-Make-ptest-run-the-python-tests-if-python-is-enab=
led.patch
> \
>             "
>
> -SRC_URI[libtar.md5sum] =3D "ae249165c173b1ff386ee8ad676815f5"
> -SRC_URI[libtar.sha256sum] =3D "ffb911191e509b966deb55de705387
> f14156e1a56b21824357cdf0053233633c"
> +SRC_URI[libtar.md5sum] =3D "5ce0da9bdaa267b40c4ca36d35363b8b"
> +SRC_URI[libtar.sha256sum] =3D "4031c1ecee9ce7ba4f313e91ef6284
> 164885cdb69937a123f6a83bb6a72dcd38"
>  SRC_URI[testtar.md5sum] =3D "ae3d1ebe000a3972afa104ca7f0e1b4a"
>  SRC_URI[testtar.sha256sum] =3D "96151685cec997e1f9f3387e3626d6
> 1e6284d4d6e66e0e440c209286c03e9cc7"
>
> --
> 2.1.4
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a113ff7d0dfd1c0055a42418a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry but:</div><div><br></div><div>| NOTE: make DEST=
DIR=3D/data/poky-tmp/master/build/work/corei7-64-poky-linux/libxml2/2.9.5-r=
0/image/usr/lib/libxml2/ptest install-ptest</div><div>| install: cannot sta=
t &#39;testSchemas&#39;: No such file or directory</div><div><div>| install=
: cannot stat &#39;testRelax&#39;: No such file or directory</div><div>| in=
stall: cannot stat &#39;testSAX&#39;: No such file or directory</div><div>|=
 install: cannot stat &#39;testHTML&#39;: No such file or directory</div><d=
iv>| install: cannot stat &#39;testXPath&#39;: No such file or directory</d=
iv><div>| install: cannot stat &#39;testURI&#39;: No such file or directory=
</div><div>| install: cannot stat &#39;testThreads&#39;: No such file or di=
rectory</div><div>| install: cannot stat &#39;testC14N&#39;: No such file o=
r directory</div><div>| install: cannot stat &#39;testAutomata&#39;: No suc=
h file or directory</div><div>| install: cannot stat &#39;testRegexp&#39;: =
No such file or directory</div><div>| install: cannot stat &#39;testReader&=
#39;: No such file or directory</div><div>| install: cannot stat &#39;testa=
pi&#39;: No such file or directory</div><div>| install: cannot stat &#39;te=
stModule&#39;: No such file or directory</div><div>| install: cannot stat &=
#39;runtest&#39;: No such file or directory</div><div>| install: cannot sta=
t &#39;runsuite&#39;: No such file or directory</div><div>| install: cannot=
 stat &#39;testchar&#39;: No such file or directory</div><div>| install: ca=
nnot stat &#39;testdict&#39;: No such file or directory</div><div>| install=
: cannot stat &#39;runxmlconf&#39;: No such file or directory</div><div>| i=
nstall: cannot stat &#39;testrecurse&#39;: No such file or directory</div><=
div>| install: cannot stat &#39;testlimits&#39;: No such file or directory<=
/div><div>| Makefile:1908: recipe for target &#39;install-ptest&#39; failed=
</div></div><div><br></div><div>Ross</div><div><br></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 28 September 2017 at 13:=
06, Andrej Valek <span dir=3D"ltr">&lt;<a href=3D"mailto:andrej.valek@sieme=
ns.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><span class=3D"">Signed-off-by: Andrej Vale=
k &lt;<a href=3D"mailto:andrej.valek@siemens.com">andrej.valek@siemens.com<=
/a>&gt;<br>
---<br>
=C2=A0.../libxml/libxml2/libxml-m4-<wbr>use-pkgconfig.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../libxml/libxml2/libxml2-<wbr>CVE-2016-4658.patch=C2=A0 =C2=A0 =C2=
=A0| 269 ----------<br>
=C2=A0.../libxml/libxml2/libxml2-<wbr>CVE-2016-5131.patch=C2=A0 =C2=A0 =C2=
=A0| 180 -------<br>
=C2=A0.../libxml/libxml2/libxml2-<wbr>CVE-2017-0663.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 40 --<br>
=C2=A0.../libxml/libxml2/libxml2-<wbr>CVE-2017-5969.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 62 ---<br>
=C2=A0.../libxml/libxml2/libxml2-<wbr>CVE-2017-8872.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 37 --<br>
=C2=A0.../libxml2-CVE-2017-9047_CVE-<wbr>2017-9048.patch=C2=A0 =C2=A0 =C2=
=A0 | 103 ----<br>
=C2=A0.../libxml2-CVE-2017-9049_CVE-<wbr>2017-9050.patch=C2=A0 =C2=A0 =C2=
=A0 | 291 ----------<br>
=C2=A0.../libxml2/libxml2-fix_NULL_<wbr>pointer_derefs.patch=C2=A0 |=C2=A0 =
45 --<br>
=C2=A0...ibxml2-fix_and_simplify_<wbr>xmlParseStartTag2.patch | 590 -------=
--------------<br>
=C2=A0.../libxml2/libxml2-fix_node_<wbr>comparison.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 67 ---<br>
</span>=C2=A0meta/recipes-core/libxml/<wbr>libxml2/runtest.patch=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 34 +-<br>
<span class=3D"">=C2=A0.../libxml/{<a href=3D"http://libxml2_2.9.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libxml2_2.9.4.bb</a> =3D&gt; <a href=3D"h=
ttp://libxml2_2.9.5.bb" rel=3D"noreferrer" target=3D"_blank">libxml2_2.9.5.=
bb</a>}=C2=A0 |=C2=A0 14 +-<br>
</span>=C2=A013 files changed, 11 insertions(+), 1723 deletions(-)<br>
<div><div class=3D"h5">=C2=A0delete mode 100644 meta/recipes-core/libxml/<w=
br>libxml2/libxml2-CVE-2016-4658.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-=
2016-5131.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-=
2017-0663.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-=
2017-5969.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-=
2017-8872.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-=
2017-9047_<wbr>CVE-2017-9048.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-=
2017-9049_<wbr>CVE-2017-9050.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_=
NULL_<wbr>pointer_derefs.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_=
and_<wbr>simplify_xmlParseStartTag2.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_=
node_<wbr>comparison.patch<br>
=C2=A0rename meta/recipes-core/libxml/{<a href=3D"http://libxml2_2.9.4.bb" =
rel=3D"noreferrer" target=3D"_blank">libx<wbr>ml2_2.9.4.bb</a> =3D&gt; <a h=
ref=3D"http://libxml2_2.9.5.bb" rel=3D"noreferrer" target=3D"_blank">libxml=
2_2.9.5.bb</a>} (85%)<br>
<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/libxml-m4-use-<wbr>pkgco=
nfig.patch b/meta/recipes-core/libxml/<wbr>libxml2/libxml-m4-use-<wbr>pkgco=
nfig.patch<br>
index 3277165..d9ed151 100644<br>
--- a/meta/recipes-core/libxml/<wbr>libxml2/libxml-m4-use-<wbr>pkgconfig.pa=
tch<br>
+++ b/meta/recipes-core/libxml/<wbr>libxml2/libxml-m4-use-<wbr>pkgconfig.pa=
tch<br>
@@ -183,7 +183,7 @@ index 68cd824..5fa0a9b 100644<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;*** If you have an old=
 version installed, it is best to remove it, although&quot;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;*** you may also be ab=
le to get things to work by modifying LD_LIBRARY_PATH&quot; ],<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ echo &quot;*** The test program failed=
 to compile or link. See the file config.log for the&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;*** exact error that occure=
d. This usually means LIBXML was incorrectly installed&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;*** exact error that occurr=
ed. This usually means LIBXML was incorrectly installed&quot;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;*** or that you have m=
oved LIBXML since it was installed. In the latter case, you&quot;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;*** may want to edit t=
he xml2-config script: $XML2_CONFIG&quot; ])<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$ac_save_CPPFLAG=
S&quot;<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2016-4658.<w=
br>patch b/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2016-4658.<wbr=
>patch<br>
deleted file mode 100644<br>
index bb55eed..0000000<br>
--- a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2016-4658.<wbr>patc=
h<br>
+++ /dev/null<br>
@@ -1,269 +0,0 @@<br>
-libxml2-2.9.4: Fix CVE-2016-4658<br>
-<br>
-[No upstream tracking] -- <a href=3D"https://bugzilla.redhat.com/show_bug.=
cgi?id=3DCVE-2016-4658" rel=3D"noreferrer" target=3D"_blank">https://bugzil=
la.redhat.com/<wbr>show_bug.cgi?id=3DCVE-2016-4658</a><br>
-<br>
-xpointer: Disallow namespace nodes in XPointer points and ranges<br>
-<br>
-Namespace nodes must be copied to avoid use-after-free errors.<br>
-But they don&#39;t necessarily have a physical representation in a<br>
-document, so simply disallow them in XPointer ranges.<br>
-<br>
-Upstream-Status: Backport<br>
- - [<a href=3D"https://git.gnome.org/browse/libxml2/commit/?id=3Dc1d1f7121=
194036608bf555f08d3062a36fd344b" rel=3D"noreferrer" target=3D"_blank">https=
://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D<wbr>c1d1f7121194036608bf=
555f08d306<wbr>2a36fd344b</a>]<br>
- - [<a href=3D"https://git.gnome.org/browse/libxml2/commit/?id=3D3f8a91036=
d338e51c059d54397a42d645f019c65" rel=3D"noreferrer" target=3D"_blank">https=
://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D<wbr>3f8a91036d338e51c059=
d54397a42d<wbr>645f019c65</a>]<br>
-CVE: CVE-2016-4658<br>
-Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
">andrej.valek@siemens.com</a>&gt;<br>
-Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">=
pascal.bach@siemens.com</a>&gt;<br>
-<br>
-diff --git a/xpointer.c b/xpointer.c<br>
-index 676c510..911680d 100644<br>
---- a/xpointer.c<br>
-+++ b/xpointer.c<br>
-@@ -320,6 +320,45 @@ xmlXPtrRangesEqual(<wbr>xmlXPathObjectPtr range1, xml=
XPathObjectPtr range2) {<br>
- }<br>
-<br>
- /**<br>
-+ * xmlXPtrNewRangeInternal:<br>
-+ * @start:=C2=A0 the starting node<br>
-+ * @startindex:=C2=A0 the start index<br>
-+ * @end:=C2=A0 the ending point<br>
-+ * @endindex:=C2=A0 the ending index<br>
-+ *<br>
-+ * Internal function to create a new xmlXPathObjectPtr of type range<br>
-+ *<br>
-+ * Returns the newly created object.<br>
-+ */<br>
-+static xmlXPathObjectPtr<br>
-+xmlXPtrNewRangeInternal(<wbr>xmlNodePtr start, int startindex,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 xmlNodePtr end, int endindex) {<br>
-+=C2=A0 =C2=A0 xmlXPathObjectPtr ret;<br>
-+<br>
-+=C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0* Namespace nodes must be copied (see xmlXPathNodeSet=
DupNs).<br>
-+=C2=A0 =C2=A0 =C2=A0* Disallow them for now.<br>
-+=C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 if ((start !=3D NULL) &amp;&amp; (start-&gt;type =3D=3D XML=
_NAMESPACE_DECL))<br>
-+=C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
-+=C2=A0 =C2=A0 if ((end !=3D NULL) &amp;&amp; (end-&gt;type =3D=3D XML_NAM=
ESPACE_DECL))<br>
-+=C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
-+<br>
-+=C2=A0 =C2=A0 ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(<wbr>xmlXPathO=
bject));<br>
-+=C2=A0 =C2=A0 if (ret =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPtrErrMemory(&quot;allocating range&quot;=
);<br>
-+=C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 memset(ret, 0, sizeof(xmlXPathObject));<br>
-+=C2=A0 =C2=A0 ret-&gt;type =3D XPATH_RANGE;<br>
-+=C2=A0 =C2=A0 ret-&gt;user =3D start;<br>
-+=C2=A0 =C2=A0 ret-&gt;index =3D startindex;<br>
-+=C2=A0 =C2=A0 ret-&gt;user2 =3D end;<br>
-+=C2=A0 =C2=A0 ret-&gt;index2 =3D endindex;<br>
-+=C2=A0 =C2=A0 return(ret);<br>
-+}<br>
-+<br>
-+/**<br>
-=C2=A0 * xmlXPtrNewRange:<br>
-=C2=A0 * @start:=C2=A0 the starting node<br>
-=C2=A0 * @startindex:=C2=A0 the start index<br>
-@@ -344,17 +383,7 @@ xmlXPtrNewRange(xmlNodePtr start, int startindex,<br>
-=C2=A0 =C2=A0 =C2=A0if (endindex &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return(NULL);<br>
-<br>
--=C2=A0 =C2=A0 ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(<wbr>xmlXPathO=
bject));<br>
--=C2=A0 =C2=A0 if (ret =3D=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPtrErrMemory(&quot;allocating range&quot;=
);<br>
--=C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
--=C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 memset(ret, 0 , (size_t) sizeof(xmlXPathObject));<br>
--=C2=A0 =C2=A0 ret-&gt;type =3D XPATH_RANGE;<br>
--=C2=A0 =C2=A0 ret-&gt;user =3D start;<br>
--=C2=A0 =C2=A0 ret-&gt;index =3D startindex;<br>
--=C2=A0 =C2=A0 ret-&gt;user2 =3D end;<br>
--=C2=A0 =C2=A0 ret-&gt;index2 =3D endindex;<br>
-+=C2=A0 =C2=A0 ret =3D xmlXPtrNewRangeInternal(start, startindex, end, end=
index);<br>
-=C2=A0 =C2=A0 =C2=A0xmlXPtrRangeCheckOrder(ret);<br>
-=C2=A0 =C2=A0 =C2=A0return(ret);<br>
- }<br>
-@@ -381,17 +410,8 @@ xmlXPtrNewRangePoints(<wbr>xmlXPathObjectPtr start, x=
mlXPathObjectPtr end) {<br>
-=C2=A0 =C2=A0 =C2=A0if (end-&gt;type !=3D XPATH_POINT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return(NULL);<br>
-<br>
--=C2=A0 =C2=A0 ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(<wbr>xmlXPathO=
bject));<br>
--=C2=A0 =C2=A0 if (ret =3D=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPtrErrMemory(&quot;allocating range&quot;=
);<br>
--=C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
--=C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 memset(ret, 0 , (size_t) sizeof(xmlXPathObject));<br>
--=C2=A0 =C2=A0 ret-&gt;type =3D XPATH_RANGE;<br>
--=C2=A0 =C2=A0 ret-&gt;user =3D start-&gt;user;<br>
--=C2=A0 =C2=A0 ret-&gt;index =3D start-&gt;index;<br>
--=C2=A0 =C2=A0 ret-&gt;user2 =3D end-&gt;user;<br>
--=C2=A0 =C2=A0 ret-&gt;index2 =3D end-&gt;index;<br>
-+=C2=A0 =C2=A0 ret =3D xmlXPtrNewRangeInternal(start-<wbr>&gt;user, start-=
&gt;index, end-&gt;user,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end-&gt;index);<br>
-=C2=A0 =C2=A0 =C2=A0xmlXPtrRangeCheckOrder(ret);<br>
-=C2=A0 =C2=A0 =C2=A0return(ret);<br>
- }<br>
-@@ -416,17 +436,7 @@ xmlXPtrNewRangePointNode(<wbr>xmlXPathObjectPtr start=
, xmlNodePtr end) {<br>
-=C2=A0 =C2=A0 =C2=A0if (start-&gt;type !=3D XPATH_POINT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return(NULL);<br>
-<br>
--=C2=A0 =C2=A0 ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(<wbr>xmlXPathO=
bject));<br>
--=C2=A0 =C2=A0 if (ret =3D=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPtrErrMemory(&quot;allocating range&quot;=
);<br>
--=C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
--=C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 memset(ret, 0 , (size_t) sizeof(xmlXPathObject));<br>
--=C2=A0 =C2=A0 ret-&gt;type =3D XPATH_RANGE;<br>
--=C2=A0 =C2=A0 ret-&gt;user =3D start-&gt;user;<br>
--=C2=A0 =C2=A0 ret-&gt;index =3D start-&gt;index;<br>
--=C2=A0 =C2=A0 ret-&gt;user2 =3D end;<br>
--=C2=A0 =C2=A0 ret-&gt;index2 =3D -1;<br>
-+=C2=A0 =C2=A0 ret =3D xmlXPtrNewRangeInternal(start-<wbr>&gt;user, start-=
&gt;index, end, -1);<br>
-=C2=A0 =C2=A0 =C2=A0xmlXPtrRangeCheckOrder(ret);<br>
-=C2=A0 =C2=A0 =C2=A0return(ret);<br>
- }<br>
-@@ -453,17 +463,7 @@ xmlXPtrNewRangeNodePoint(<wbr>xmlNodePtr start, xmlXP=
athObjectPtr end) {<br>
-=C2=A0 =C2=A0 =C2=A0if (end-&gt;type !=3D XPATH_POINT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return(NULL);<br>
-<br>
--=C2=A0 =C2=A0 ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(<wbr>xmlXPathO=
bject));<br>
--=C2=A0 =C2=A0 if (ret =3D=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPtrErrMemory(&quot;allocating range&quot;=
);<br>
--=C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
--=C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 memset(ret, 0 , (size_t) sizeof(xmlXPathObject));<br>
--=C2=A0 =C2=A0 ret-&gt;type =3D XPATH_RANGE;<br>
--=C2=A0 =C2=A0 ret-&gt;user =3D start;<br>
--=C2=A0 =C2=A0 ret-&gt;index =3D -1;<br>
--=C2=A0 =C2=A0 ret-&gt;user2 =3D end-&gt;user;<br>
--=C2=A0 =C2=A0 ret-&gt;index2 =3D end-&gt;index;<br>
-+=C2=A0 =C2=A0 ret =3D xmlXPtrNewRangeInternal(start, -1, end-&gt;user, en=
d-&gt;index);<br>
-=C2=A0 =C2=A0 =C2=A0xmlXPtrRangeCheckOrder(ret);<br>
-=C2=A0 =C2=A0 =C2=A0return(ret);<br>
- }<br>
-@@ -486,17 +486,7 @@ xmlXPtrNewRangeNodes(<wbr>xmlNodePtr start, xmlNodePt=
r end) {<br>
-=C2=A0 =C2=A0 =C2=A0if (end =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return(NULL);<br>
-<br>
--=C2=A0 =C2=A0 ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(<wbr>xmlXPathO=
bject));<br>
--=C2=A0 =C2=A0 if (ret =3D=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPtrErrMemory(&quot;allocating range&quot;=
);<br>
--=C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
--=C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 memset(ret, 0 , (size_t) sizeof(xmlXPathObject));<br>
--=C2=A0 =C2=A0 ret-&gt;type =3D XPATH_RANGE;<br>
--=C2=A0 =C2=A0 ret-&gt;user =3D start;<br>
--=C2=A0 =C2=A0 ret-&gt;index =3D -1;<br>
--=C2=A0 =C2=A0 ret-&gt;user2 =3D end;<br>
--=C2=A0 =C2=A0 ret-&gt;index2 =3D -1;<br>
-+=C2=A0 =C2=A0 ret =3D xmlXPtrNewRangeInternal(start, -1, end, -1);<br>
-=C2=A0 =C2=A0 =C2=A0xmlXPtrRangeCheckOrder(ret);<br>
-=C2=A0 =C2=A0 =C2=A0return(ret);<br>
- }<br>
-@@ -516,17 +506,7 @@ xmlXPtrNewCollapsedRange(<wbr>xmlNodePtr start) {<br>
-=C2=A0 =C2=A0 =C2=A0if (start =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return(NULL);<br>
-<br>
--=C2=A0 =C2=A0 ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(<wbr>xmlXPathO=
bject));<br>
--=C2=A0 =C2=A0 if (ret =3D=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPtrErrMemory(&quot;allocating range&quot;=
);<br>
--=C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
--=C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 memset(ret, 0 , (size_t) sizeof(xmlXPathObject));<br>
--=C2=A0 =C2=A0 ret-&gt;type =3D XPATH_RANGE;<br>
--=C2=A0 =C2=A0 ret-&gt;user =3D start;<br>
--=C2=A0 =C2=A0 ret-&gt;index =3D -1;<br>
--=C2=A0 =C2=A0 ret-&gt;user2 =3D NULL;<br>
--=C2=A0 =C2=A0 ret-&gt;index2 =3D -1;<br>
-+=C2=A0 =C2=A0 ret =3D xmlXPtrNewRangeInternal(start, -1, NULL, -1);<br>
-=C2=A0 =C2=A0 =C2=A0return(ret);<br>
- }<br>
-<br>
-@@ -541,6 +521,8 @@ xmlXPtrNewCollapsedRange(<wbr>xmlNodePtr start) {<br>
-=C2=A0 */<br>
- xmlXPathObjectPtr<br>
- xmlXPtrNewRangeNodeObject(<wbr>xmlNodePtr start, xmlXPathObjectPtr end) {=
<br>
-+=C2=A0 =C2=A0 xmlNodePtr endNode;<br>
-+=C2=A0 =C2=A0 int endIndex;<br>
-=C2=A0 =C2=A0 =C2=A0xmlXPathObjectPtr ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0if (start =3D=3D NULL)<br>
-@@ -549,7 +531,12 @@ xmlXPtrNewRangeNodeObject(<wbr>xmlNodePtr start, xmlX=
PathObjectPtr end) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return(NULL);<br>
-=C2=A0 =C2=A0 =C2=A0switch (end-&gt;type) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case XPATH_POINT:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endNode =3D end-&gt;user;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endIndex =3D end-&gt;index;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case XPATH_RANGE:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endNode =3D end-&gt;user2;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endIndex =3D end-&gt;index2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case XPATH_NODESET:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-@@ -557,39 +544,15 @@ xmlXPtrNewRangeNodeObject(<wbr>xmlNodePtr start, xml=
XPathObjectPtr end) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (end-&gt;nodesetval-&gt;nodeNr=
 &lt;=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return(NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endNode =3D end-&gt;nodesetval-&gt;nod=
eTab[end-&gt;<wbr>nodesetval-&gt;nodeNr - 1];<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endIndex =3D -1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return(NULL);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(<wbr>xmlXPathO=
bject));<br>
--=C2=A0 =C2=A0 if (ret =3D=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPtrErrMemory(&quot;allocating range&quot;=
);<br>
--=C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
--=C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 memset(ret, 0 , (size_t) sizeof(xmlXPathObject));<br>
--=C2=A0 =C2=A0 ret-&gt;type =3D XPATH_RANGE;<br>
--=C2=A0 =C2=A0 ret-&gt;user =3D start;<br>
--=C2=A0 =C2=A0 ret-&gt;index =3D -1;<br>
--=C2=A0 =C2=A0 switch (end-&gt;type) {<br>
--=C2=A0 =C2=A0 =C2=A0 case XPATH_POINT:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret-&gt;user2 =3D end-&gt;user;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret-&gt;index2 =3D end-&gt;index;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
--=C2=A0 =C2=A0 =C2=A0 case XPATH_RANGE:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret-&gt;user2 =3D end-&gt;user2;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret-&gt;index2 =3D end-&gt;index2;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
--=C2=A0 =C2=A0 =C2=A0 case XPATH_NODESET: {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret-&gt;user2 =3D end-&gt;nodesetval-&=
gt;nodeTab[end-&gt;<wbr>nodesetval-&gt;nodeNr - 1];<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret-&gt;index2 =3D -1;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 default:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STRANGE<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
--=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 ret =3D xmlXPtrNewRangeInternal(start, -1, endNode, endInde=
x);<br>
-=C2=A0 =C2=A0 =C2=A0xmlXPtrRangeCheckOrder(ret);<br>
-=C2=A0 =C2=A0 =C2=A0return(ret);<br>
- }<br>
-@@ -1835,8 +1798,8 @@ xmlXPtrStartPointFunction(<wbr>xmlXPathParserContext=
Ptr ctxt, int nargs) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case XPATH_RANGE: {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlNo=
dePtr node =3D tmp-&gt;user;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (n=
ode !=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (node-&gt;type =3D=3D XML_ATTRIBUTE_NODE) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* TODO: Namespace Nodes ??? */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((node-&gt;type =3D=3D XML_ATTRIBUTE_NODE) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(node-&gt;type =3D=3D XML_NAMESPACE_DECL)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0xmlXPathFreeObject(obj);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0xmlXPtrFreeLocationSet(newset)<wbr>;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0XP_ERROR(XPTR_SYNTAX_ERROR);<br>
-@@ -1931,8 +1894,8 @@ xmlXPtrEndPointFunction(<wbr>xmlXPathParserContextPt=
r ctxt, int nargs) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case XPATH_RANGE: {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlNo=
dePtr node =3D tmp-&gt;user2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (n=
ode !=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (node-&gt;type =3D=3D XML_ATTRIBUTE_NODE) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* TODO: Namespace Nodes ??? */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((node-&gt;type =3D=3D XML_ATTRIBUTE_NODE) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(node-&gt;type =3D=3D XML_NAMESPACE_DECL)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0xmlXPathFreeObject(obj);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0xmlXPtrFreeLocationSet(newset)<wbr>;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0XP_ERROR(XPTR_SYNTAX_ERROR);<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2016-5131.<w=
br>patch b/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2016-5131.<wbr=
>patch<br>
deleted file mode 100644<br>
index 9d47d02..0000000<br>
--- a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2016-5131.<wbr>patc=
h<br>
+++ /dev/null<br>
@@ -1,180 +0,0 @@<br>
-From 9ab01a277d71f54d3143c2cf333c5c<wbr>2e9aaedd9e Mon Sep 17 00:00:00 200=
1<br>
-From: Nick Wellnhofer &lt;<a href=3D"mailto:wellnhofer@aevum.de">wellnhofe=
r@aevum.de</a>&gt;<br>
-Date: Tue, 28 Jun 2016 14:22:23 +0200<br>
-Subject: [PATCH] Fix XPointer paths beginning with range-to<br>
-<br>
-The old code would invoke the broken xmlXPtrRangeToFunction. range-to<br>
-isn&#39;t really a function but a special kind of location step. Remove<br=
>
-this function and always handle range-to in the XPath code.<br>
-<br>
-The old xmlXPtrRangeToFunction could also be abused to trigger a<br>
-use-after-free error with the potential for remote code execution.<br>
-<br>
-Found with afl-fuzz.<br>
-<br>
-Fixes CVE-2016-5131.<br>
-<br>
-CVE: CVE-2016-5131<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://git.gnome.org/browse/libxml2/commit/?id=3D9ab01a277d71f=
54d3143c2cf333c5c2e9aaedd9e" rel=3D"noreferrer" target=3D"_blank">https://g=
it.gnome.org/browse/<wbr>libxml2/commit/?id=3D<wbr>9ab01a277d71f54d3143c2cf=
333c5c<wbr>2e9aaedd9e</a><br>
-<br>
-Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windirver.com">yi.zha=
o@windirver.com</a>&gt;<br>
----<br>
- result/XPath/xptr/vidbase | 13 ++++++++<br>
- test/XPath/xptr/vidbase=C2=A0 =C2=A0|=C2=A0 1 +<br>
- xpath.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 7 ++++-<br>
- xpointer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 76 ++=
++--------------------------<wbr>-----------------<br>
- 4 files changed, 26 insertions(+), 71 deletions(-)<br>
-<br>
-diff --git a/result/XPath/xptr/vidbase b/result/XPath/xptr/vidbase<br>
-index 8b9e92d..f19193e 100644<br>
---- a/result/XPath/xptr/vidbase<br>
-+++ b/result/XPath/xptr/vidbase<br>
-@@ -17,3 +17,16 @@ Object is a Location Set:<br>
-=C2=A0 =C2=A0To node<br>
-=C2=A0 =C2=A0 =C2=A0ELEMENT p<br>
-<br>
-+<br>
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<=
br>
-+Expression: xpointer(range-to(id(&#39;<wbr>chapter2&#39;)))<br>
-+Object is a Location Set:<br>
-+1 :=C2=A0 =C2=A0Object is a range :<br>
-+=C2=A0 From node<br>
-+=C2=A0 =C2=A0 =C2=A0/<br>
-+=C2=A0 To node<br>
-+=C2=A0 =C2=A0 ELEMENT chapter<br>
-+=C2=A0 =C2=A0 =C2=A0 ATTRIBUTE id<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEXT<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 content=3Dchapter2<br>
-+<br>
-diff --git a/test/XPath/xptr/vidbase b/test/XPath/xptr/vidbase<br>
-index b146383..884b106 100644<br>
---- a/test/XPath/xptr/vidbase<br>
-+++ b/test/XPath/xptr/vidbase<br>
-@@ -1,2 +1,3 @@<br>
- xpointer(id(&#39;chapter1&#39;)/p)<br>
- xpointer(id(&#39;chapter1&#39;)/p[1]/<wbr>range-to(following-sibling::p[<=
wbr>2]))<br>
-+xpointer(range-to(id(&#39;<wbr>chapter2&#39;)))<br>
-diff --git a/xpath.c b/xpath.c<br>
-index d992841..5a01b1b 100644<br>
---- a/xpath.c<br>
-+++ b/xpath.c<br>
-@@ -10691,13 +10691,18 @@ xmlXPathCompPathExpr(<wbr>xmlXPathParserContextP=
tr ctxt) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lc =
=3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if ((NXT(len=
) =3D=3D &#39;(&#39;)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Note Ty=
pe or Function */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Node Ty=
pe or Function */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (x=
mlXPathIsNodeType(name)) {<br>
- #ifdef DEBUG_STEP<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0xmlGenericError(<wbr>xmlGenericErrorContext,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;PathExpr: Type search\n&quot;);=
<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0lc =3D 1;<br>
-+#ifdef LIBXML_XPTR_ENABLED<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } e=
lse if (ctxt-&gt;xptr &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlStrEqual(name, BAD_CAST &quot;rang=
e-to&quot;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lc =3D 1;<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} els=
e {<br>
- #ifdef DEBUG_STEP<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0xmlGenericError(<wbr>xmlGenericErrorContext,<br>
-diff --git a/xpointer.c b/xpointer.c<br>
-index 676c510..d74174a 100644<br>
---- a/xpointer.c<br>
-+++ b/xpointer.c<br>
-@@ -1332,8 +1332,6 @@ xmlXPtrNewContext(xmlDocPtr doc, xmlNodePtr here, xm=
lNodePtr origin) {<br>
-=C2=A0 =C2=A0 =C2=A0ret-&gt;here =3D here;<br>
-=C2=A0 =C2=A0 =C2=A0ret-&gt;origin =3D origin;<br>
-<br>
--=C2=A0 =C2=A0 xmlXPathRegisterFunc(ret, (xmlChar *)&quot;range-to&quot;,<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0xmlXPtrRangeToFunction);<br>
-=C2=A0 =C2=A0 =C2=A0xmlXPathRegisterFunc(ret, (xmlChar *)&quot;range&quot;=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 xmlXPtrRangeFunction);<br>
-=C2=A0 =C2=A0 =C2=A0xmlXPathRegisterFunc(ret, (xmlChar *)&quot;range-insid=
e&quot;,<br>
-@@ -2243,76 +2241,14 @@ xmlXPtrRangeInsideFunction(<wbr>xmlXPathParserCont=
extPtr ctxt, int nargs) {<br>
-=C2=A0 * @nargs:=C2=A0 the number of args<br>
-=C2=A0 *<br>
-=C2=A0 * Implement the range-to() XPointer function<br>
-+ *<br>
-+ * Obsolete. range-to is not a real function but a special type of locati=
on<br>
-+ * step which is handled in xpath.c.<br>
-=C2=A0 */<br>
- void<br>
--xmlXPtrRangeToFunction(<wbr>xmlXPathParserContextPtr ctxt, int nargs) {<b=
r>
--=C2=A0 =C2=A0 xmlXPathObjectPtr range;<br>
--=C2=A0 =C2=A0 const xmlChar *cur;<br>
--=C2=A0 =C2=A0 xmlXPathObjectPtr res, obj;<br>
--=C2=A0 =C2=A0 xmlXPathObjectPtr tmp;<br>
--=C2=A0 =C2=A0 xmlLocationSetPtr newset =3D NULL;<br>
--=C2=A0 =C2=A0 xmlNodeSetPtr oldset;<br>
--=C2=A0 =C2=A0 int i;<br>
--<br>
--=C2=A0 =C2=A0 if (ctxt =3D=3D NULL) return;<br>
--=C2=A0 =C2=A0 CHECK_ARITY(1);<br>
--=C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0* Save the expression pointer since we will have to e=
valuate<br>
--=C2=A0 =C2=A0 =C2=A0* it multiple times. Initialize the new set.<br>
--=C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 CHECK_TYPE(XPATH_NODESET);<br>
--=C2=A0 =C2=A0 obj =3D valuePop(ctxt);<br>
--=C2=A0 =C2=A0 oldset =3D obj-&gt;nodesetval;<br>
--=C2=A0 =C2=A0 ctxt-&gt;context-&gt;node =3D NULL;<br>
--<br>
--=C2=A0 =C2=A0 cur =3D ctxt-&gt;cur;<br>
--=C2=A0 =C2=A0 newset =3D xmlXPtrLocationSetCreate(NULL)<wbr>;<br>
--<br>
--=C2=A0 =C2=A0 for (i =3D 0; i &lt; oldset-&gt;nodeNr; i++) {<br>
--=C2=A0 =C2=A0 =C2=A0 ctxt-&gt;cur =3D cur;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0* Run the evaluation with a node list made of =
a single item<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0* in the nodeset.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 ctxt-&gt;context-&gt;node =3D oldset-&gt;nodeTab[i];=
<br>
--=C2=A0 =C2=A0 =C2=A0 tmp =3D xmlXPathNewNodeSet(ctxt-&gt;<wbr>context-&gt=
;node);<br>
--=C2=A0 =C2=A0 =C2=A0 valuePush(ctxt, tmp);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 xmlXPathEvalExpr(ctxt);<br>
--=C2=A0 =C2=A0 =C2=A0 CHECK_ERROR;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0* The result of the evaluation need to be test=
ed to<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0* decided whether the filter succeeded or not<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 res =3D valuePop(ctxt);<br>
--=C2=A0 =C2=A0 =C2=A0 range =3D xmlXPtrNewRangeNodeObject(<wbr>oldset-&gt;=
nodeTab[i], res);<br>
--=C2=A0 =C2=A0 =C2=A0 if (range !=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPtrLocationSetAdd(newset, range);<=
br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0* Cleanup<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 if (res !=3D NULL)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPathFreeObject(res);<br>
--=C2=A0 =C2=A0 =C2=A0 if (ctxt-&gt;value =3D=3D tmp) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D valuePop(ctxt);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPathFreeObject(res);<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 ctxt-&gt;context-&gt;node =3D NULL;<br>
--=C2=A0 =C2=A0 }<br>
--<br>
--=C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0* The result is used as the new evaluation set.<br>
--=C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 xmlXPathFreeObject(obj);<br>
--=C2=A0 =C2=A0 ctxt-&gt;context-&gt;node =3D NULL;<br>
--=C2=A0 =C2=A0 ctxt-&gt;context-&gt;contextSize =3D -1;<br>
--=C2=A0 =C2=A0 ctxt-&gt;context-&gt;<wbr>proximityPosition =3D -1;<br>
--=C2=A0 =C2=A0 valuePush(ctxt, xmlXPtrWrapLocationSet(newset)<wbr>);<br>
-+xmlXPtrRangeToFunction(<wbr>xmlXPathParserContextPtr ctxt,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int nargs ATTRIBUTE_UNUSED) {<br>
-+=C2=A0 =C2=A0 XP_ERROR(XPATH_EXPR_ERROR);<br>
- }<br>
-<br>
- /**<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-0663.<w=
br>patch b/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-0663.<wbr=
>patch<br>
deleted file mode 100644<br>
index 0108265..0000000<br>
--- a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-0663.<wbr>patc=
h<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-libxml2: Fix CVE-2017-0663<br>
-<br>
-[No upstream tracking] -- <a href=3D"https://bugzilla.gnome.org/show_bug.c=
gi?id=3D780228" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome=
.org/<wbr>show_bug.cgi?id=3D780228</a><br>
-<br>
-valid: Fix type confusion in xmlValidateOneNamespace<br>
-<br>
-Comment out code that casts xmlNsPtr to xmlAttrPtr. ID types<br>
-on namespace declarations make no practical sense anyway.<br>
-<br>
-Fixes bug 780228<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.gnome.org/browse/libxml2=
/commit/?id=3D92b9e8c8b3787068565a1820ba575d042f9eec66" rel=3D"noreferrer" =
target=3D"_blank">https://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D<w=
br>92b9e8c8b3787068565a1820ba575d<wbr>042f9eec66</a>]<br>
-CVE: CVE-2017-0663<br>
-Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
">andrej.valek@siemens.com</a>&gt;<br>
-<br>
-diff --git a/valid.c b/valid.c<br>
-index 19f84b8..e03d35e 100644<br>
---- a/valid.c<br>
-+++ b/valid.c<br>
-@@ -4621,6 +4621,12 @@ xmlNodePtr elem, const xmlChar *prefix, xmlNsPtr ns=
, const xmlChar *value) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-+=C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0* Casting ns to xmlAttrPtr is wrong. We&#39;d need se=
parate functions<br>
-+=C2=A0 =C2=A0 =C2=A0* xmlAddID and xmlAddRef for namespace declarations, =
but it makes<br>
-+=C2=A0 =C2=A0 =C2=A0* no practical sense to use ID types anyway.<br>
-+=C2=A0 =C2=A0 =C2=A0*/<br>
-+#if 0<br>
-=C2=A0 =C2=A0 =C2=A0/* Validity Constraint: ID uniqueness */<br>
-=C2=A0 =C2=A0 =C2=A0if (attrDecl-&gt;atype =3D=3D XML_ATTRIBUTE_ID) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (xmlAddID(ctxt, doc, value, (xmlAttrP=
tr) ns) =3D=3D NULL)<br>
-@@ -4632,6 +4638,7 @@ xmlNodePtr elem, const xmlChar *prefix, xmlNsPtr ns,=
 const xmlChar *value) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (xmlAddRef(ctxt, doc, value, (xmlAttr=
Ptr) ns) =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-+#endif<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0/* Validity Constraint: Notation Attributes */<br>
-=C2=A0 =C2=A0 =C2=A0if (attrDecl-&gt;atype =3D=3D XML_ATTRIBUTE_NOTATION) =
{<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-5969.<w=
br>patch b/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-5969.<wbr=
>patch<br>
deleted file mode 100644<br>
index 571b05c..0000000<br>
--- a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-5969.<wbr>patc=
h<br>
+++ /dev/null<br>
@@ -1,62 +0,0 @@<br>
-libxml2-2.9.4: Fix CVE-2017-5969<br>
-<br>
-[No upstream tracking] -- <a href=3D"https://bugzilla.gnome.org/show_bug.c=
gi?id=3D758422" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome=
.org/<wbr>show_bug.cgi?id=3D758422</a><br>
-<br>
-valid: Fix NULL pointer deref in xmlDumpElementContent<br>
-<br>
-Can only be triggered in recovery mode.<br>
-<br>
-Fixes bug 758422<br>
-<br>
-Upstream-Status: Backport - [<a href=3D"https://git.gnome.org/browse/libxm=
l2/commit/?id=3D94691dc884d1a8ada39f073408b4bb92fe7fe882" rel=3D"noreferrer=
" target=3D"_blank">https://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D=
<wbr>94691dc884d1a8ada39f073408b4bb<wbr>92fe7fe882</a>]<br>
-CVE: CVE-2017-5969<br>
-Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
">andrej.valek@siemens.com</a>&gt;<br>
-<br>
-diff --git a/valid.c b/valid.c<br>
-index 19f84b8..0a8e58a 100644<br>
---- a/valid.c<br>
-+++ b/valid.c<br>
-@@ -1172,29 +1172,33 @@ xmlDumpElementContent(<wbr>xmlBufferPtr buf, xmlEl=
ementContentPtr content, int glob)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlBufferWriteCHAR(buf, content-&=
gt;name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case XML_ELEMENT_CONTENT_SEQ:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((content-&gt;c1-&gt;type =3D=3D XM=
L_ELEMENT_CONTENT_OR) ||<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (content-&gt;c1-&gt;type=
 =3D=3D XML_ELEMENT_CONTENT_SEQ))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((content-&gt;c1 !=3D NULL) &amp;&a=
mp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((content-&gt;c1-&gt;typ=
e =3D=3D XML_ELEMENT_CONTENT_OR) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(content-&gt;c1-&g=
t;type =3D=3D XML_ELEMENT_CONTENT_SEQ)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlDumpElementConte=
nt(buf, content-&gt;c1, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlDumpElementConte=
nt(buf, content-&gt;c1, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlBufferWriteChar(buf, &q=
uot; , &quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((content-&gt;c2-&gt;type =3D=3D XM=
L_ELEMENT_CONTENT_OR) ||<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((content-&gt;c2-&gt;typ=
e =3D=3D XML_ELEMENT_CONTENT_SEQ) &amp;&amp;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(content-&gt;c2-&g=
t;ocur !=3D XML_ELEMENT_CONTENT_ONCE)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((content-&gt;c2 !=3D NULL) &amp;&a=
mp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((content-&gt;c2-&gt;typ=
e =3D=3D XML_ELEMENT_CONTENT_OR) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((content-&gt;c2-&=
gt;type =3D=3D XML_ELEMENT_CONTENT_SEQ) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (content-&gt;c2-&=
gt;ocur !=3D XML_ELEMENT_CONTENT_ONCE))))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlDumpElementConte=
nt(buf, content-&gt;c2, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlDumpElementConte=
nt(buf, content-&gt;c2, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case XML_ELEMENT_CONTENT_OR:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((content-&gt;c1-&gt;type =3D=3D XM=
L_ELEMENT_CONTENT_OR) ||<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (content-&gt;c1-&gt;type=
 =3D=3D XML_ELEMENT_CONTENT_SEQ))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((content-&gt;c1 !=3D NULL) &amp;&a=
mp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((content-&gt;c1-&gt;typ=
e =3D=3D XML_ELEMENT_CONTENT_OR) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(content-&gt;c1-&g=
t;type =3D=3D XML_ELEMENT_CONTENT_SEQ)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlDumpElementConte=
nt(buf, content-&gt;c1, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlDumpElementConte=
nt(buf, content-&gt;c1, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlBufferWriteChar(buf, &q=
uot; | &quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((content-&gt;c2-&gt;type =3D=3D XM=
L_ELEMENT_CONTENT_SEQ) ||<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((content-&gt;c2-&gt;typ=
e =3D=3D XML_ELEMENT_CONTENT_OR) &amp;&amp;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(content-&gt;c2-&g=
t;ocur !=3D XML_ELEMENT_CONTENT_ONCE)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((content-&gt;c2 !=3D NULL) &amp;&a=
mp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((content-&gt;c2-&gt;typ=
e =3D=3D XML_ELEMENT_CONTENT_SEQ) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((content-&gt;c2-&=
gt;type =3D=3D XML_ELEMENT_CONTENT_OR) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (content-&gt;c2-&=
gt;ocur !=3D XML_ELEMENT_CONTENT_ONCE))))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlDumpElementConte=
nt(buf, content-&gt;c2, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlDumpElementConte=
nt(buf, content-&gt;c2, 0);<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-8872.<w=
br>patch b/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-8872.<wbr=
>patch<br>
deleted file mode 100644<br>
index 26779aa..0000000<br>
--- a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-8872.<wbr>patc=
h<br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-From d2f873a541c72b0f67e15562819bf9<wbr>8b884b30b7 Mon Sep 17 00:00:00 200=
1<br>
-From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
-Date: Wed, 23 Aug 2017 16:04:49 +0800<br>
-Subject: [PATCH] fix CVE-2017-8872<br>
-<br>
-this makes xmlHaltParser &quot;empty&quot; the buffer, as it resets cur an=
d ava<br>
-il too here.<br>
-<br>
-this seems to cure this specific issue, and also passes the testsuite<br>
-<br>
-Signed-off-by: Marcus Meissner &lt;<a href=3D"mailto:meissner@suse.de">mei=
ssner@suse.de</a>&gt;<br>
-<br>
-<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D775200" rel=3D"nor=
eferrer" target=3D"_blank">https://bugzilla.gnome.org/<wbr>show_bug.cgi?id=
=3D775200</a><br>
-Upstream-Status: Backport [<a href=3D"https://bugzilla.gnome.org/attachmen=
t.cgi?id=3D355527&amp;action=3Ddiff" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bugzilla.gnome.org/<wbr>attachment.cgi?id=3D355527&amp;<wbr>action=
=3Ddiff</a>]<br>
-Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
----<br>
- parser.c | 4 ++++<br>
- 1 file changed, 4 insertions(+)<br>
-<br>
-diff --git a/parser.c b/parser.c<br>
-index 9506ead..6c07ffd 100644<br>
---- a/parser.c<br>
-+++ b/parser.c<br>
-@@ -12664,6 +12664,10 @@ xmlHaltParser(xmlParserCtxtPtr ctxt) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ctxt-&gt;input-&gt;cur =3D BAD_CAST&quot;&quot;=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ctxt-&gt;input-&gt;base =3D ctxt-&gt;input-&gt;=
cur;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (ctxt-&gt;input-&gt;buf) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlBufEmpty (ctxt-&gt;in=
put-&gt;buf-&gt;buffer);<br>
-+=C2=A0 =C2=A0 =C2=A0 } else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctxt-&gt;input-&gt;lengt=
h =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
-<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-9047_<w=
br>CVE-2017-9048.patch b/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-=
2017-9047_<wbr>CVE-2017-9048.patch<br>
deleted file mode 100644<br>
index 8b03456..0000000<br>
--- a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-9047_<wbr>CVE-=
2017-9048.patch<br>
+++ /dev/null<br>
@@ -1,103 +0,0 @@<br>
-libxml2-2.9.4: Fix CVE-2017-9047 and CVE-2017-9048<br>
-<br>
-[No upstream tracking] -- <a href=3D"https://bugzilla.gnome.org/show_bug.c=
gi?id=3D781333" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome=
.org/<wbr>show_bug.cgi?id=3D781333</a><br>
- -- <a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D781701" rel=3D=
"noreferrer" target=3D"_blank">https://bugzilla.gnome.org/<wbr>show_bug.cgi=
?id=3D781701</a><br>
-<br>
-valid: Fix buffer size checks in xmlSnprintfElementContent<br>
-<br>
-xmlSnprintfElementContent failed to correctly check the available<br>
-buffer space in two locations.<br>
-<br>
-Fixes bug 781333 and bug 781701<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.gnome.org/browse/libxml2=
/commit/?id=3D932cc9896ab41475d4aa429c27d9afd175959d74" rel=3D"noreferrer" =
target=3D"_blank">https://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D<w=
br>932cc9896ab41475d4aa429c27d9af<wbr>d175959d74</a>]<br>
-CVE: CVE-2017-9047 CVE-2017-9048<br>
-Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
">andrej.valek@siemens.com</a>&gt;<br>
-<br>
-diff --git a/result/valid/781333.xml b/result/valid/781333.xml<br>
-new file mode 100644<br>
-index 0000000..01baf11<br>
---- /dev/null<br>
-+++ b/result/valid/781333.xml<br>
-@@ -0,0 +1,5 @@<br>
-+&lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
-+&lt;!DOCTYPE a [<br>
-+&lt;!ELEMENT a (<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppp=
ppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppp=
pppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppp=
ppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<w=
br>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pp=
pppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppp=
ppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppp=
pppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppp=
ppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppp=
pppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppp=
ppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<w=
br>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pp=
pppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppp=
ppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppp=
pppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppp=
ppppppppppppp<wbr>pppppppppppppp!<br>
=C2=A0ppppppppp<br>
=C2=A0pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppp=
pppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppp=
ppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppp=
pppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppp=
ppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppp=
pppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppppp=
p<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppp=
pppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppp=
ppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppp=
pppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppp=
ppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppp=
pppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppppp=
p<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppp!<br>
=C2=A0ppppppppp<br>
=C2=A0pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppp=
pppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppp=
ppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppp=
pppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppp=
ppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppp=
pppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppppp=
p<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppp=
pppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppp=
ppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppp=
pppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppp=
ppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppp=
pppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppppp=
p<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppp!<br>
=C2=A0ppppppppp<br>
=C2=A0pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppp=
pppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppp=
ppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppp=
pppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppp=
ppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppp=
pppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppppp=
p<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppp=
pppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppp=
ppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppp=
pppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppp=
ppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppp=
pppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppppp=
p<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppp!<br>
=C2=A0ppppppppp<br>
=C2=A0pppppppppppppppppppppppppp:<wbr>llllllllllllllllllllllllllllll<wbr>ll=
llllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllll=
lllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllll=
llllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllll=
lllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllll=
llllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllllllllllllll=
lll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<w=
br>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>ll=
llllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllll=
lllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllll=
llllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllll=
lllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllll=
llllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllllllllllllll=
lll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<w=
br>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>ll=
llllllllllllllllllllllllllll<wbr>l!<br>
=C2=A0lllllllll<br>
=C2=A0llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr=
>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llll=
llllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllll=
lllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllll=
llllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllllll=
lllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllll=
llllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllllllllllllllll=
l<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr=
>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llll=
llllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllll=
lllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllll=
llllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllllll=
lllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllll=
llllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllllllllllllllll=
l<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr=
>llllllllllllllllllllllllllll!<br>
=C2=A0lllllllll<br>
=C2=A0llllllllllllllllllllllllllllll<wbr>lll)&gt;<br>
-+]&gt;<br>
-+&lt;a/&gt;<br>
-diff --git a/result/valid/781333.xml.err b/result/valid/781333.xml.err<br>
-new file mode 100644<br>
-index 0000000..2176200<br>
---- /dev/null<br>
-+++ b/result/valid/781333.xml.err<br>
-@@ -0,0 +1,3 @@<br>
-+./test/valid/781333.xml:4: element a: validity error : Element a content =
does not follow the DTD, expecting ( ..., got<br>
-+&lt;a/&gt;<br>
-+=C2=A0 =C2=A0 ^<br>
-diff --git a/result/valid/781333.xml.err.<wbr>rdr b/result/valid/781333.xm=
l.err.<wbr>rdr<br>
-new file mode 100644<br>
-index 0000000..1195a04<br>
---- /dev/null<br>
-+++ b/result/valid/781333.xml.err.<wbr>rdr<br>
-@@ -0,0 +1,6 @@<br>
-+./test/valid/781333.xml:4: element a: validity error : Element a content =
does not follow the DTD, expecting ( ..., got<br>
-+&lt;a/&gt;<br>
-+=C2=A0 =C2=A0 ^<br>
-+./test/valid/781333.xml:5: element a: validity error : Element a content =
does not follow the DTD, Expecting more child<br>
-+<br>
-+^<br>
-diff --git a/test/valid/781333.xml b/test/valid/781333.xml<br>
-new file mode 100644<br>
-index 0000000..bceac9c<br>
---- /dev/null<br>
-+++ b/test/valid/781333.xml<br>
-@@ -0,0 +1,4 @@<br>
-+&lt;!DOCTYPE a [<br>
-+=C2=A0 =C2=A0 &lt;!ELEMENT a (<wbr>pppppppppppppppppppppppppppppp<wbr>ppp=
ppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppp=
pppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppp=
ppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppp=
pppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppp=
ppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppp=
pp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wb=
r>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppp=
ppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppp=
pppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppp=
ppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppp=
pppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppp=
ppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppp=
pp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wb=
r>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppp=
ppppppppppppppppppppppppppp<wbr>pppppppppp!<br>
=C2=A0ppppppppp<br>
=C2=A0pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppp=
pppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppp=
ppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppp=
pppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppp=
ppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppp=
pppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppppp=
p<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppp=
pppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppp=
ppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppp=
pppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppp=
ppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppp=
pppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppppp=
p<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppp!<br>
=C2=A0ppppppppp<br>
=C2=A0pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppp=
pppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppp=
ppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppp=
pppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppp=
ppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppp=
pppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppppp=
p<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppp=
pppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppp=
ppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppp=
pppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppp=
ppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppp=
pppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppppp=
p<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppp!<br>
=C2=A0ppppppppp<br>
=C2=A0pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppp=
pppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppp=
ppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppp=
pppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppp=
ppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppp=
pppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppppp=
p<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppp=
pppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppp=
ppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppp=
pppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppp=
ppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppp=
pppppp<wbr>pppppppppppppppppppppppppppppp<wbr>ppppppppppppppppppppppppppppp=
p<wbr>pppppppppppppppppppppppppppppp<wbr>pppppppppppppppppppppppppppppp<wbr=
>pppppppppppppppppppppppppppp!<br>
=C2=A0ppppppppp<br>
=C2=A0pppppppppppppppppppppppppppppp<wbr>:<wbr>llllllllllllllllllllllllllll=
ll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wb=
r>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lll=
lllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllll=
llllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllll=
lllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllll=
llllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllllllllll=
lllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllll=
ll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wb=
r>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lll=
lllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllll=
llllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllll=
lllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllll=
llllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllllllllll=
lllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllll=
ll<wbr>lllllllllllllllllllllllllll!<br>
=C2=A0lllllllll<br>
=C2=A0llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr=
>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llll=
llllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllll=
lllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllll=
llllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllllll=
lllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllll=
llllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllllllllllllllll=
l<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr=
>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llll=
llllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllll=
lllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllll=
llllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllllll=
lllllllllll<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllll=
llllll<wbr>llllllllllllllllllllllllllllll<wbr>lllllllllllllllllllllllllllll=
l<wbr>llllllllllllllllllllllllllllll<wbr>llllllllllllllllllllllllllllll<wbr=
>llllllllllllllllllllllllllll!<br>
=C2=A0lllllllll<br>
=C2=A0llllllllllllllllllllllllllllll<wbr>lllllll)&gt;<br>
-+]&gt;<br>
-+&lt;a/&gt;<br>
-diff --git a/valid.c b/valid.c<br>
-index 19f84b8..aaa30f6 100644<br>
---- a/valid.c<br>
-+++ b/valid.c<br>
-@@ -1262,22 +1262,23 @@ xmlSnprintfElementContent(char *buf, int size, xml=
ElementContentPtr content, int<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case XML_ELEMENT_CONTENT_PCDATA:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcat(buf, &quot;#PCDATA&=
quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
--=C2=A0 =C2=A0 =C2=A0 case XML_ELEMENT_CONTENT_ELEMENT:<br>
-+=C2=A0 =C2=A0 =C2=A0 case XML_ELEMENT_CONTENT_ELEMENT: {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int qnameLen =3D xmlStrlen(cont=
ent-&gt;name);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (content-&gt;prefix !=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qnameLen +=3D xml=
Strlen(content-&gt;prefix) + 1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size - len &lt; qnameLen + 10) {<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strcat(buf, &quot; ...&q=
uot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (content-&gt;prefix !=3D NULL)=
 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size - len &lt; xmlS=
trlen(content-&gt;prefix) + 10) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strcat(buf=
, &quot; ...&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcat(buf, (char *=
) content-&gt;prefix);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcat(buf, &quot;:=
&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size - len &lt; xmlStrlen(content-=
&gt;name) + 10) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strcat(buf, &quot; ...&q=
uot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (content-&gt;name !=3D NULL)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcat(buf, (char *=
) content-&gt;name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case XML_ELEMENT_CONTENT_SEQ:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((content-&gt;c1-&gt;type =3D=
=3D XML_ELEMENT_CONTENT_OR) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(content-&gt;c1-&gt=
;type =3D=3D XML_ELEMENT_CONTENT_SEQ))<br>
-@@ -1319,6 +1320,7 @@ xmlSnprintfElementContent(char *buf, int size, xmlEl=
ementContentPtr content, int<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlSnprintfElementC=
ontent(buf, size, content-&gt;c2, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 if (size - strlen(buf) &lt;=3D 2) return;<br>
-=C2=A0 =C2=A0 =C2=A0if (englob)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcat(buf, &quot;)&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0switch (content-&gt;ocur) {<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-9049_<w=
br>CVE-2017-9050.patch b/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-=
2017-9049_<wbr>CVE-2017-9050.patch<br>
deleted file mode 100644<br>
index 591075d..0000000<br>
--- a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-CVE-2017-9049_<wbr>CVE-=
2017-9050.patch<br>
+++ /dev/null<br>
@@ -1,291 +0,0 @@<br>
-libxml2-2.9.4: Fix CVE-2017-9049 and CVE-2017-9050<br>
-<br>
-[No upstream tracking] -- <a href=3D"https://bugzilla.gnome.org/show_bug.c=
gi?id=3D781205" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome=
.org/<wbr>show_bug.cgi?id=3D781205</a><br>
- -- <a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D781361" rel=3D=
"noreferrer" target=3D"_blank">https://bugzilla.gnome.org/<wbr>show_bug.cgi=
?id=3D781361</a><br>
-<br>
-parser: Fix handling of parameter-entity references<br>
-<br>
-There were two bugs where parameter-entity references could lead to an<br>
-unexpected change of the input buffer in xmlParseNameComplex and<br>
-xmlDictLookup being called with an invalid pointer.<br>
-<br>
-Percent sign in DTD Names<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
-<br>
-The NEXTL macro used to call xmlParserHandlePEReference. When parsing<br>
-&quot;complex&quot; names inside the DTD, this could result in entity expa=
nsion<br>
-which created a new input buffer. The fix is to simply remove the call<br>
-to xmlParserHandlePEReference from the NEXTL macro. This is safe because<b=
r>
-no users of the macro require expansion of parameter entities.<br>
-<br>
-- xmlParseNameComplex<br>
-- xmlParseNCNameComplex<br>
-- xmlParseNmtoken<br>
-<br>
-The percent sign is not allowed in names, which are grammatical tokens.<br=
>
-<br>
-- xmlParseEntityValue<br>
-<br>
-Parameter-entity references in entity values are expanded but this<br>
-happens in a separate step in this function.<br>
-<br>
-- xmlParseSystemLiteral<br>
-<br>
-Parameter-entity references are ignored in the system literal.<br>
-<br>
-- xmlParseAttValueComplex<br>
-- xmlParseCharDataComplex<br>
-- xmlParseCommentComplex<br>
-- xmlParsePI<br>
-- xmlParseCDSect<br>
-<br>
-Parameter-entity references are ignored outside the DTD.<br>
-<br>
-- xmlLoadEntityContent<br>
-<br>
-This function is only called from xmlStringLenDecodeEntities and<br>
-entities are replaced in a separate step immediately after the function<br=
>
-call.<br>
-<br>
-This bug could also be triggered with an internal subset and double<br>
-entity expansion.<br>
-<br>
-This fixes bug 766956 initially reported by Wei Lei and independently by<b=
r>
-Chromium&#39;s ClusterFuzz, Hanno B=C3=B6ck, and Marco Grassi. Thanks to e=
veryone<br>
-involved.<br>
-<br>
-xmlParseNameComplex with XML_PARSE_OLD10<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-<br>
-When parsing Names inside an expanded parameter entity with the<br>
-XML_PARSE_OLD10 option, xmlParseNameComplex would call xmlGROW via the<br>
-GROW macro if the input buffer was exhausted. At the end of the<br>
-parameter entity&#39;s replacement text, this function would then call<br>
-xmlPopInput which invalidated the input buffer.<br>
-<br>
-There should be no need to invoke GROW in this situation because the<br>
-buffer is grown periodically every XML_PARSER_CHUNK_SIZE characters and,<b=
r>
-at least for UTF-8, in xmlCurrentChar. This also matches the code path<br>
-executed when XML_PARSE_OLD10 is not set.<br>
-<br>
-This fixes bugs 781205 (CVE-2017-9049) and 781361 (CVE-2017-9050).<br>
-Thanks to Marcel B=C3=B6hme and Thuan Pham for the report.<br>
-<br>
-Additional hardening<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-<br>
-A separate check was added in xmlParseNameComplex to validate the<br>
-buffer size.<br>
-<br>
-Fixes bug 781205 and bug 781361<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.gnome.org/browse/libxml2=
/commit/?id=3D932cc9896ab41475d4aa429c27d9afd175959d74" rel=3D"noreferrer" =
target=3D"_blank">https://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D<w=
br>932cc9896ab41475d4aa429c27d9af<wbr>d175959d74</a>]<br>
-CVE: CVE-2017-9049 CVE-2017-9050<br>
-Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
">andrej.valek@siemens.com</a>&gt;<br>
-<br>
-diff --git a/Makefile.am b/Makefile.am<br>
-index 9f988b0..dab15a4 100644<br>
---- a/Makefile.am<br>
-+++ b/Makefile.am<br>
-@@ -422,6 +422,24 @@ Errtests : xmllint$(EXEEXT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$$log&quot; =
] ; then echo $$name result ; echo $$log ; fi ; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm result.$$name error.$$n=
ame ; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi ; fi ; done)<br>
-+=C2=A0 =C2=A0 =C2=A0 @echo &quot;## Error cases regression tests (old 1.0=
)&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 -@(for i in $(srcdir)/test/errors10/*.xml ; do \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 name=3D`basename $$i`; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -d $$i ] ; then \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -f $(srcdir)/result/errors10/$$<wbr>na=
me ] ; then \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo New test file $$name ; \<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CHECKER) $(top_builddir)/xmll=
int --oldxml10 $$i \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02&gt; $(srcdir)/re=
sult/errors10/$$<wbr>name.err \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; $(srcdir)/res=
ult/errors10/$$<wbr>name ; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grep &quot;MORY ALLO&quot; .mem=
dump=C2=A0 | grep -v &quot;MEMORY ALLOCATED : 0&quot;; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log=3D`$(CHECKER) $(top_builddi=
r)/xmllint --oldxml10 $$i 2&gt; error.$$name &gt; result.$$name ; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grep &quot;MORY ALLO&quot; .mem=
dump=C2=A0 | grep -v &quot;MEMORY ALLOCATED : 0&quot;; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diff $(srcdir)/result/errors10/=
$$<wbr>name result.$$name ; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diff $(srcdir)/result/errors10/=
$$<wbr>name.err error.$$name` ; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$$log&quot; ] ; t=
hen echo $$name result ; echo &quot;$$log&quot; ; fi ; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm result.$$name error.$$name ;=
 \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ; fi ; done)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;## Error cases stream regression te=
sts&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-@(for i in $(srcdir)/test/errors/*.xml ; do \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name=3D`basename $$i`; \<br>
-diff --git a/parser.c b/parser.c<br>
-index 609a270..8e11c12 100644<br>
---- a/parser.c<br>
-+++ b/parser.c<br>
-@@ -2115,7 +2115,6 @@ static void xmlGROW (xmlParserCtxtPtr ctxt) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ctxt-&gt;input-&gt;line++; ctxt-&gt;input-&gt;c=
ol =3D 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0} else ctxt-&gt;input-&gt;col++;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
-=C2=A0 =C2=A0 =C2=A0ctxt-&gt;input-&gt;cur +=3D l;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
--=C2=A0 =C2=A0 if (*ctxt-&gt;input-&gt;cur =3D=3D &#39;%&#39;) xmlParserHa=
ndlePEReference(<wbr>ctxt);=C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0} while (0)<br>
-<br>
- #define CUR_CHAR(l) xmlCurrentChar(ctxt, &amp;l)<br>
-@@ -3406,13 +3405,6 @@ xmlParseNameComplex(<wbr>xmlParserCtxtPtr ctxt) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D l;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NEXTL(l);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c =3D CUR_CHAR(l);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (c =3D=3D 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GROW;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctxt-&gt;inst=
ate =3D=3D XML_PARSER_EOF)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn(NULL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D CUR_CHAR(l);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0if ((len &gt; XML_MAX_NAME_LENGTH) &amp;&amp;<br>
-@@ -3420,6 +3412,16 @@ xmlParseNameComplex(<wbr>xmlParserCtxtPtr ctxt) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG,=
 &quot;Name&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return(NULL);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 if (ctxt-&gt;input-&gt;cur - ctxt-&gt;input-&gt;base &lt; l=
en) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* There were a couple of bugs where PER=
efs lead to to a change<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* of the buffer. Check the buffer size =
to avoid passing an invalid<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* pointer to xmlDictLookup.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFatalErr(ctxt, XML_ERR_INTERNAL_ERROR,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;unexpected change of input buffer&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (NULL);<br>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0if ((*ctxt-&gt;input-&gt;cur =3D=3D &#39;\n&#39;) &amp=
;&amp; (ctxt-&gt;input-&gt;cur[-1] =3D=3D &#39;\r&#39;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return(xmlDictLookup(ctxt-&gt;<wbr>dict,=
 ctxt-&gt;input-&gt;cur - (len + 1), len));<br>
-=C2=A0 =C2=A0 =C2=A0return(xmlDictLookup(ctxt-&gt;<wbr>dict, ctxt-&gt;inpu=
t-&gt;cur - len, len));<br>
-diff --git a/result/errors10/781205.xml b/result/errors10/781205.xml<br>
-new file mode 100644<br>
-index 0000000..e69de29<br>
-diff --git a/result/errors10/781205.xml.<wbr>err b/result/errors10/781205.=
xml.<wbr>err<br>
-new file mode 100644<br>
-index 0000000..da15c3f<br>
---- /dev/null<br>
-+++ b/result/errors10/781205.xml.<wbr>err<br>
-@@ -0,0 +1,21 @@<br>
-+Entity: line 1: parser error : internal error: xmlParseInternalSubset: er=
ror detected in Markup declaration<br>
-+<br>
-+ %a;<br>
-+=C2=A0 =C2=A0 ^<br>
-+Entity: line 1:<br>
-+&lt;:0000<br>
-+^<br>
-+Entity: line 1: parser error : DOCTYPE improperly terminated<br>
-+ %a;<br>
-+=C2=A0 =C2=A0 ^<br>
-+Entity: line 1:<br>
-+&lt;:0000<br>
-+^<br>
-+namespace error : Failed to parse QName &#39;:0000&#39;<br>
-+ %a;<br>
-+=C2=A0 =C2=A0 ^<br>
-+&lt;:0000<br>
-+=C2=A0 =C2=A0 =C2=A0 ^<br>
-+./test/errors10/781205.xml:<wbr>4: parser error : Couldn&#39;t find end o=
f Start Tag :0000 line 1<br>
-+<br>
-+^<br>
-diff --git a/result/errors10/781361.xml b/result/errors10/781361.xml<br>
-new file mode 100644<br>
-index 0000000..e69de29<br>
-diff --git a/result/errors10/781361.xml.<wbr>err b/result/errors10/781361.=
xml.<wbr>err<br>
-new file mode 100644<br>
-index 0000000..655f41a<br>
---- /dev/null<br>
-+++ b/result/errors10/781361.xml.<wbr>err<br>
-@@ -0,0 +1,13 @@<br>
-+./test/errors10/781361.xml:<wbr>4: parser error : xmlParseElementDecl: &#=
39;EMPTY&#39;, &#39;ANY&#39; or &#39;(&#39; expected<br>
-+<br>
-+^<br>
-+./test/errors10/781361.xml:<wbr>4: parser error : internal error: xmlPars=
eInternalSubset: error detected in Markup declaration<br>
-+<br>
-+<br>
-+^<br>
-+./test/errors10/781361.xml:<wbr>4: parser error : DOCTYPE improperly term=
inated<br>
-+<br>
-+^<br>
-+./test/errors10/781361.xml:<wbr>4: parser error : Start tag expected, &#3=
9;&lt;&#39; not found<br>
-+<br>
-+^<br>
-diff --git a/result/valid/766956.xml b/result/valid/766956.xml<br>
-new file mode 100644<br>
-index 0000000..e69de29<br>
-diff --git a/result/valid/766956.xml.err b/result/valid/766956.xml.err<br>
-new file mode 100644<br>
-index 0000000..34b1dae<br>
---- /dev/null<br>
-+++ b/result/valid/766956.xml.err<br>
-@@ -0,0 +1,9 @@<br>
-+test/valid/dtds/766956.dtd:<wbr>2: parser error : PEReference: expecting =
&#39;;&#39;<br>
-+%=C3=A4%ent;<br>
-+=C2=A0 =C2=A0^<br>
-+Entity: line 1: parser error : Content error in the external subset<br>
-+ %ent;<br>
-+=C2=A0 =C2=A0 =C2=A0 ^<br>
-+Entity: line 1:<br>
-+value<br>
-+^<br>
-diff --git a/result/valid/766956.xml.err.<wbr>rdr b/result/valid/766956.xm=
l.err.<wbr>rdr<br>
-new file mode 100644<br>
-index 0000000..7760346<br>
---- /dev/null<br>
-+++ b/result/valid/766956.xml.err.<wbr>rdr<br>
-@@ -0,0 +1,10 @@<br>
-+test/valid/dtds/766956.dtd:<wbr>2: parser error : PEReference: expecting =
&#39;;&#39;<br>
-+%=C3=A4%ent;<br>
-+=C2=A0 =C2=A0^<br>
-+Entity: line 1: parser error : Content error in the external subset<br>
-+ %ent;<br>
-+=C2=A0 =C2=A0 =C2=A0 ^<br>
-+Entity: line 1:<br>
-+value<br>
-+^<br>
-+./test/valid/766956.xml : failed to parse<br>
-diff --git a/runtest.c b/runtest.c<br>
-index bb74d2a..63e8c20 100644<br>
---- a/runtest.c<br>
-+++ b/runtest.c<br>
-@@ -4202,6 +4202,9 @@ testDesc testDescriptions[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0{ &quot;Error cases regression tests&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0errParseTest, &quot;./test/errors/*.xml&quot;, =
&quot;result/errors/&quot;, &quot;&quot;, &quot;.err&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A00 },<br>
-+=C2=A0 =C2=A0 { &quot;Error cases regression tests (old 1.0)&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 errParseTest, &quot;./test/errors10/*.xml&quot;, &qu=
ot;result/errors10/&quot;, &quot;&quot;, &quot;.err&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 XML_PARSE_OLD10 },<br>
- #ifdef LIBXML_READER_ENABLED<br>
-=C2=A0 =C2=A0 =C2=A0{ &quot;Error cases stream regression tests&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0streamParseTest, &quot;./test/errors/*.xml&quot=
;, &quot;result/errors/&quot;, NULL, &quot;.str&quot;,<br>
-diff --git a/test/errors10/781205.xml b/test/errors10/781205.xml<br>
-new file mode 100644<br>
-index 0000000..d9e9e83<br>
---- /dev/null<br>
-+++ b/test/errors10/781205.xml<br>
-@@ -0,0 +1,3 @@<br>
-+&lt;!DOCTYPE D [<br>
-+=C2=A0 &lt;!ENTITY % a &quot;&lt;:0000&quot;&gt;<br>
-+=C2=A0 %a;<br>
-diff --git a/test/errors10/781361.xml b/test/errors10/781361.xml<br>
-new file mode 100644<br>
-index 0000000..67476bc<br>
---- /dev/null<br>
-+++ b/test/errors10/781361.xml<br>
-@@ -0,0 +1,3 @@<br>
-+&lt;!DOCTYPE doc [<br>
-+=C2=A0 &lt;!ENTITY % elem &quot;&lt;!ELEMENT e0000000000&quot;&gt;<br>
-+=C2=A0 %elem;<br>
-diff --git a/test/valid/766956.xml b/test/valid/766956.xml<br>
-new file mode 100644<br>
-index 0000000..19a95a0<br>
---- /dev/null<br>
-+++ b/test/valid/766956.xml<br>
-@@ -0,0 +1,2 @@<br>
-+&lt;!DOCTYPE test SYSTEM &quot;dtds/766956.dtd&quot;&gt;<br>
-+&lt;test/&gt;<br>
-diff --git a/test/valid/dtds/766956.dtd b/test/valid/dtds/766956.dtd<br>
-new file mode 100644<br>
-index 0000000..dddde68<br>
---- /dev/null<br>
-+++ b/test/valid/dtds/766956.dtd<br>
-@@ -0,0 +1,2 @@<br>
-+&lt;!ENTITY % ent &quot;value&quot;&gt;<br>
-+%=C3=A4%ent;<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_NULL_<wbr>po=
inter_derefs.patch b/meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_NULL=
_<wbr>pointer_derefs.patch<br>
deleted file mode 100644<br>
index c60e32f..0000000<br>
--- a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_NULL_<wbr>pointer_d=
erefs.patch<br>
+++ /dev/null<br>
@@ -1,45 +0,0 @@<br>
-libxml2-2.9.4: Fix more NULL pointer derefs<br>
-<br>
-xpointer: Fix more NULL pointer derefs<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.gnome.org/browse/libxml2=
/commit/?id=3De905f08123e4a6e7731549e6f09dadff4cab65bd" rel=3D"noreferrer" =
target=3D"_blank">https://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D<w=
br>e905f08123e4a6e7731549e6f09dad<wbr>ff4cab65bd</a>]<br>
-Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
">andrej.valek@siemens.com</a>&gt;<br>
-Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">=
pascal.bach@siemens.com</a>&gt;<br>
-<br>
-diff --git a/xpointer.c b/xpointer.c<br>
-index 676c510..074db24 100644<br>
---- a/xpointer.c<br>
-+++ b/xpointer.c<br>
-@@ -555,7 +555,7 @@ xmlXPtrNewRangeNodeObject(<wbr>xmlNodePtr start, xmlXP=
athObjectPtr end) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Empty set ...<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (end-&gt;nodesetval-&gt;nodeNr &lt;=
=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((end-&gt;nodesetval =3D=3D NULL) |=
| (end-&gt;nodesetval-&gt;nodeNr &lt;=3D 0))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return(NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-@@ -1400,7 +1400,7 @@ xmlXPtrEval(const xmlChar *str, xmlXPathContextPtr c=
tx) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlNo=
deSetPtr set;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set =
=3D tmp-&gt;nodesetval;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((set-&=
gt;nodeNr !=3D 1) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((set =
=3D=3D NULL) || (set-&gt;nodeNr !=3D 1) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(set-&gt;nodeTab[0] !=3D (xmlNodePtr) ctx-&gt;doc))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0stack++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
-@@ -2073,9 +2073,11 @@ xmlXPtrRangeFunction(<wbr>xmlXPathParserContextPtr =
ctxt, int nargs) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0xmlXPathFreeObject(set);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XP_ERROR(XPATH_MEMORY_ERROR);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 for (i =3D 0;i &lt; oldset-&gt;locNr;i++) {<br>
--=C2=A0 =C2=A0 =C2=A0 xmlXPtrLocationSetAdd(newset,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPtrCoveringRange(ctx=
t, oldset-&gt;locTab[i]));<br>
-+=C2=A0 =C2=A0 if (oldset !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 for (i =3D 0;i &lt; oldset-&gt;locNr;i++) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPtrLocationSetAdd(newset,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlXPtrCoveringRa=
nge(ctxt, oldset-&gt;locTab[i]));<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0/*<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_and_<wbr>sim=
plify_xmlParseStartTag2.<wbr>patch b/meta/recipes-core/libxml/<wbr>libxml2/=
libxml2-fix_and_<wbr>simplify_xmlParseStartTag2.<wbr>patch<br>
deleted file mode 100644<br>
index faa5770..0000000<br>
--- a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_and_<wbr>simplify_x=
mlParseStartTag2.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,590 +0,0 @@<br>
-libxml2-2.9.4: Avoid reparsing and simplify control flow in xmlParseStartT=
ag2<br>
-<br>
-[No upstream tracking]<br>
-<br>
-parser: Avoid reparsing in xmlParseStartTag2<br>
-<br>
-The code in xmlParseStartTag2 must handle the case that the input<br>
-buffer was grown and reallocated which can invalidate pointers to<br>
-attribute values. Before, this was handled by detecting changes of<br>
-the input buffer &quot;base&quot; pointer and, in case of a change, jumpin=
g<br>
-back to the beginning of the function and reparsing the start tag.<br>
-<br>
-The major problem of this approach is that whether an input buffer is<br>
-reallocated is nondeterministic, resulting in seemingly random test<br>
-failures. See the mailing list thread &quot;runtest mystery bug: name2.xml=
<br>
-error case regression test&quot; from 2012, for example.<br>
-<br>
-If a reallocation was detected, the code also made no attempts to<br>
-continue parsing in case of errors which makes a difference in<br>
-the lax &quot;recover&quot; mode.<br>
-<br>
-Now we store the current input buffer &quot;base&quot; pointer for each (n=
ot<br>
-separately allocated) attribute in the namespace URI field, which isn&#39;=
t<br>
-used until later. After the whole start tag was parsed, the pointers to<br=
>
-the attribute values are reconstructed using the offset between the<br>
-new and the old input buffer. This relies on arithmetic on dangling<br>
-pointers which is technically undefined behavior. But it seems like<br>
-the easiest and most efficient fix and a similar approach is used in<br>
-xmlParserInputGrow.<br>
-<br>
-This changes the error output of several tests, typically making it<br>
-more verbose because we try harder to continue parsing in case of errors.<=
br>
-<br>
-(Another possible solution is to check not only the &quot;base&quot; point=
er<br>
-but the size of the input buffer as well. But this would result in<br>
-even more reparsing.)<br>
-<br>
-Remove some goto labels and deduplicate a bit of code after handling<br>
-namespaces.<br>
-<br>
-There were two bugs where parameter-entity references could lead to an<br>
-unexpected change of the input buffer in xmlParseNameComplex and<br>
-xmlDictLookup being called with an invalid pointer.<br>
-<br>
-<br>
-Upstream-Status: Backport<br>
- - [<a href=3D"https://git.gnome.org/browse/libxml2/commit/?id=3D07b7428b6=
9c368611d215a140fe630b2d1e61349" rel=3D"noreferrer" target=3D"_blank">https=
://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D<wbr>07b7428b69c368611d21=
5a140fe630<wbr>b2d1e61349</a>]<br>
- - [<a href=3D"https://git.gnome.org/browse/libxml2/commit/?id=3D855c19efb=
7cd30d927d673b3658563c4959ca6f0" rel=3D"noreferrer" target=3D"_blank">https=
://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D<wbr>855c19efb7cd30d927d6=
73b3658563<wbr>c4959ca6f0</a>]<br>
-Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
">andrej.valek@siemens.com</a>&gt;<br>
-<br>
-diff --git a/parser.c b/parser.c<br>
-index 609a270..74016e3 100644<br>
---- a/parser.c<br>
-+++ b/parser.c<br>
-@@ -43,6 +43,7 @@<br>
- #include &lt;limits.h&gt;<br>
- #include &lt;string.h&gt;<br>
- #include &lt;stdarg.h&gt;<br>
-+#include &lt;stddef.h&gt;<br>
- #include &lt;libxml/xmlmemory.h&gt;<br>
- #include &lt;libxml/threads.h&gt;<br>
- #include &lt;libxml/globals.h&gt;<br>
-@@ -9377,8 +9378,7 @@ xmlParseStartTag2(<wbr>xmlParserCtxtPtr ctxt, const =
xmlChar **pref,<br>
-=C2=A0 =C2=A0 =C2=A0const xmlChar **atts =3D ctxt-&gt;atts;<br>
-=C2=A0 =C2=A0 =C2=A0int maxatts =3D ctxt-&gt;maxatts;<br>
-=C2=A0 =C2=A0 =C2=A0int nratts, nbatts, nbdef;<br>
--=C2=A0 =C2=A0 int i, j, nbNs, attval, oldline, oldcol, inputNr;<br>
--=C2=A0 =C2=A0 const xmlChar *base;<br>
-+=C2=A0 =C2=A0 int i, j, nbNs, attval;<br>
-=C2=A0 =C2=A0 =C2=A0unsigned long cur;<br>
-=C2=A0 =C2=A0 =C2=A0int nsNr =3D ctxt-&gt;nsNr;<br>
-<br>
-@@ -9392,13 +9392,8 @@ xmlParseStartTag2(<wbr>xmlParserCtxtPtr ctxt, const=
 xmlChar **pref,<br>
-=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0The Shrinking is only pos=
sible once the full set of attribute<br>
-=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0callbacks have been done.=
<br>
-=C2=A0 =C2=A0 =C2=A0 */<br>
--reparse:<br>
-=C2=A0 =C2=A0 =C2=A0SHRINK;<br>
--=C2=A0 =C2=A0 base =3D ctxt-&gt;input-&gt;base;<br>
-=C2=A0 =C2=A0 =C2=A0cur =3D ctxt-&gt;input-&gt;cur - ctxt-&gt;input-&gt;ba=
se;<br>
--=C2=A0 =C2=A0 inputNr =3D ctxt-&gt;inputNr;<br>
--=C2=A0 =C2=A0 oldline =3D ctxt-&gt;input-&gt;line;<br>
--=C2=A0 =C2=A0 oldcol =3D ctxt-&gt;input-&gt;col;<br>
-=C2=A0 =C2=A0 =C2=A0nbatts =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0nratts =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0nbdef =3D 0;<br>
-@@ -9422,8 +9417,6 @@ reparse:<br>
-=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0SKIP_BLANKS;<br>
-=C2=A0 =C2=A0 =C2=A0GROW;<br>
--=C2=A0 =C2=A0 if ((ctxt-&gt;input-&gt;base !=3D base) || (inputNr !=3D ct=
xt-&gt;inputNr))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto base_changed;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0while (((RAW !=3D &#39;&gt;&#39;) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((RAW !=3D &#39;/&#39;) || (NXT(1) !=3D=
 &#39;&gt;&#39;)) &amp;&amp;<br>
-@@ -9434,203 +9427,174 @@ reparse:<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0attname =3D xmlParseAttribute2(ctxt, prefix, lo=
calname,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;aprefix, &amp;att=
value, &amp;len, &amp;alloc);<br>
--=C2=A0 =C2=A0 =C2=A0 if ((ctxt-&gt;input-&gt;base !=3D base) || (inputNr =
!=3D ctxt-&gt;inputNr)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attvalue !=3D NULL) &amp;&amp; (a=
lloc !=3D 0))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFree(attvalue);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attvalue =3D NULL;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto base_changed;<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attname !=3D NULL) &amp;&amp; (attvalue =
!=3D NULL)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &lt; 0) len =3D xmlStrlen(attv=
alue);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attname =3D=3D ctxt-&gt;st=
r_xmlns) &amp;&amp; (aprefix =3D=3D NULL)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const xmlChar *URL =3D x=
mlDictLookup(ctxt-&gt;dict, attvalue, len);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlURIPtr uri;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (URL =3D=3D NU=
LL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlErrMemo=
ry(ctxt, &quot;dictionary allocation failure&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attva=
lue !=3D NULL) &amp;&amp; (alloc !=3D 0))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xmlFree(attvalue);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return(NUL=
L);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*URL !=3D 0) =
{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri =3D xm=
lParseURI((const char *) URL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (uri =
=3D=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xmlNsErr(ctxt, XML_WAR_NS_URI,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;xmlns: &#39;%s&#39; is not a va=
lid URI\n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UR=
L, NULL, NULL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (uri-&gt;scheme =3D=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;xmlns: URI %s is=
 not absolute\n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 URL, NULL, NULL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xmlFreeURI(uri);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (URL =
=3D=3D ctxt-&gt;str_xml_ns) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (attname !=3D ctxt-&gt;str_xml) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;xml namespace URI cannot be the default namespace\n&quot;,<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, NULL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto skip_default_ns;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((len =
=3D=3D 29) &amp;&amp;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (xmlStrEqual(URL,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAD_CAST &quot;<a href=3D"http://www.=
w3.org/2000/xmlns/" rel=3D"noreferrer" target=3D"_blank">http://www.w3.org/=
2000/xmlns/</a><wbr>&quot;))) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;reuse of the xmlns namespace name is forbidde=
n\n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, NULL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto skip_default_ns;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* check that it&#3=
9;s not a defined namespace<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 1;j &lt;=3D n=
bNs;j++)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctxt-&=
gt;nsTab[ctxt-&gt;nsNr - 2 * j] =3D=3D NULL)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (j &lt;=3D nbNs)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlErrAttr=
ibuteDup(ctxt, NULL, attname);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nsPush=
(ctxt, NULL, URL) &gt; 0) nbNs++;<br>
--skip_default_ns:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attvalue !=3D NULL)=
 &amp;&amp; (alloc !=3D 0)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFree(at=
tvalue);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attvalue =
=3D NULL;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((RAW =3D=3D &#39;&gt=
;&#39;) || (((RAW =3D=3D &#39;/&#39;) &amp;&amp; (NXT(1) =3D=3D &#39;&gt;&#=
39;))))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!IS_BLANK_CH(RAW)) {=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFatalEr=
rMsg(ctxt, XML_ERR_SPACE_REQUIRED,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;attributes construct err=
or\n&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SKIP_BLANKS;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ctxt-&gt;input-&gt;=
base !=3D base) || (inputNr !=3D ctxt-&gt;inputNr))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto base_=
changed;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aprefix =3D=3D ctxt-&gt;str=
_xmlns) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const xmlChar *URL =3D x=
mlDictLookup(ctxt-&gt;dict, attvalue, len);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlURIPtr uri;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (attname =3D=
=3D ctxt-&gt;str_xml) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (URL !=
=3D ctxt-&gt;str_xml_ns) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;xml namespace prefix mapped to =
wrong URI\n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, NULL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Do=
 not keep a namespace definition node<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto skip_=
ns;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attname =3D=3D NULL) || (attvalue =3D=3D=
 NULL))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto next_attr;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (len &lt; 0) len =3D xmlStrlen(attvalue);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attname =3D=3D ctxt-&gt;str_xmlns) &amp;=
&amp; (aprefix =3D=3D NULL)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const xmlChar *URL =3D xmlDictL=
ookup(ctxt-&gt;dict, attvalue, len);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlURIPtr uri;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (URL =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlErrMemory(ctxt=
, &quot;dictionary allocation failure&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attvalue !=
=3D NULL) &amp;&amp; (alloc !=3D 0))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xml=
Free(attvalue);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*URL !=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri =3D xmlParseU=
RI((const char *) URL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (uri =3D=3D NU=
LL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xml=
NsErr(ctxt, XML_WAR_NS_URI,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;xmlns: &#39;%s&#39; is not a valid URI=
\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0URL, NULL=
, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
(uri-&gt;scheme =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;xmlns: URI %s is not ab=
solute\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 URL, NULL, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xml=
FreeURI(uri);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (URL =3D=
=3D ctxt-&gt;str_xml_ns) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (attnam=
e !=3D ctxt-&gt;str_xml) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;xml namespace URI mapped to wro=
ng prefix\n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, NULL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto skip_=
ns;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (attname =3D=
=3D ctxt-&gt;str_xmlns) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlNsErr(c=
txt, XML_NS_ERR_XML_NAMESPACE,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;redefinition of the xmlns prefix is forbidden=
\n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, NULL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto skip_=
ns;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((len =3D=3D 29) &amp=
;&amp;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (xmlStrEqu=
al(URL,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAD_CAST &quot;<a href=3D"http://www.=
w3.org/2000/xmlns/" rel=3D"noreferrer" target=3D"_blank">http://www.w3.org/=
2000/xmlns/</a><wbr>&quot;))) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlNsErr(c=
txt, XML_NS_ERR_XML_NAMESPACE,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;reuse of the xmlns namespace name is forbidde=
n\n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, NULL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto skip_=
ns;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((URL =3D=3D NULL) ||=
 (URL[0] =3D=3D 0)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlNsErr(c=
txt, XML_NS_ERR_XML_NAMESPACE,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;xmlns:%s: Empty XML namespace is not allowed\=
n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attname, NULL, NULL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto skip_=
ns;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri =3D xm=
lParseURI((const char *) URL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (uri =
=3D=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xmlNsErr(ctxt, XML_WAR_NS_URI,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;xmlns:%s: &#39;%s&#39; is not a valid URI\n&q=
uot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0at=
tname, URL, NULL);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((ctxt-&gt;pedantic) &amp;&amp; (uri-&gt;scheme =3D=3D NULL)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;xmlns:%s: URI %s=
 is not absolute\n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attname, URL, NULL);<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xmlFreeURI(uri);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* check that it&#3=
9;s not a defined namespace<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 1;j &lt;=3D n=
bNs;j++)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctxt-&=
gt;nsTab[ctxt-&gt;nsNr - 2 * j] =3D=3D attname)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (j &lt;=3D nbNs)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlErrAttr=
ibuteDup(ctxt, aprefix, attname);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nsPush=
(ctxt, attname, URL) &gt; 0) nbNs++;<br>
--skip_ns:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attvalue !=3D NULL)=
 &amp;&amp; (alloc !=3D 0)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFree(at=
tvalue);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attvalue =
=3D NULL;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((RAW =3D=3D &#39;&gt=
;&#39;) || (((RAW =3D=3D &#39;/&#39;) &amp;&amp; (NXT(1) =3D=3D &#39;&gt;&#=
39;))))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!IS_BLANK_CH(RAW)) {=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFatalEr=
rMsg(ctxt, XML_ERR_SPACE_REQUIRED,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;attributes construct err=
or\n&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SKIP_BLANKS;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ctxt-&gt;input-&gt;=
base !=3D base) || (inputNr !=3D ctxt-&gt;inputNr))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto base_=
changed;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
(attname !=3D ctxt-&gt;str_xml) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;xml namespace URI cannot be the default namespace\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 got=
o next_attr;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((len =3D=3D 2=
9) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (xm=
lStrEqual(URL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAD_CAST &quot;<a href=3D"http://www.w3.org/=
2000/xmlns/" rel=3D"noreferrer" target=3D"_blank">http://www.w3.org/2000/xm=
lns/</a><wbr>&quot;))) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xml=
NsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;reuse of the xmlns namespace name is forbidden\n&quo=
t;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 got=
o next_attr;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* check that it&#39;s not=
 a defined namespace<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 1;j &lt;=3D nbNs;j++=
)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctxt-&gt;nsTa=
b[ctxt-&gt;nsNr - 2 * j] =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bre=
ak;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (j &lt;=3D nbNs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlErrAttributeDu=
p(ctxt, NULL, attname);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nsPush(ctxt, =
NULL, URL) &gt; 0) nbNs++;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (aprefix =3D=3D ctxt-&gt;str_xmlns)=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const xmlChar *URL =3D xmlDictL=
ookup(ctxt-&gt;dict, attvalue, len);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlURIPtr uri;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (attname =3D=3D ctxt-&gt;str=
_xml) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (URL !=3D ctxt=
-&gt;str_xml_ns) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xml=
NsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;xml namespace prefix mapped to wrong U=
RI\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Do not ke=
ep a namespace definition node<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto next_attr;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (URL =3D=3D ctxt-&gt;str_xml=
_ns) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (attname !=3D =
ctxt-&gt;str_xml) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xml=
NsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;xml namespace URI mapped to wrong pref=
ix\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto next_attr;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (attname =3D=3D ctxt-&gt;str=
_xmlns) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlNsErr(ctxt, XM=
L_NS_ERR_XML_NAMESPACE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;redefinition of the xmlns prefix is forbidden\n&quot=
;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0NULL, NULL, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto next_attr;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((len =3D=3D 29) &amp;&amp;<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (xmlStrEqual(URL,=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAD_CAST &quot;<a href=3D"http://www.w3.org/=
2000/xmlns/" rel=3D"noreferrer" target=3D"_blank">http://www.w3.org/2000/xm=
lns/</a><wbr>&quot;))) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlNsErr(ctxt, XM=
L_NS_ERR_XML_NAMESPACE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;reuse of the xmlns namespace name is forbidden\n&quo=
t;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0NULL, NULL, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto next_attr;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((URL =3D=3D NULL) || (URL[0=
] =3D=3D 0)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlNsErr(ctxt, XM=
L_NS_ERR_XML_NAMESPACE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;xmlns:%s: Empty XML namespace is not allowed\n&quot;=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attname, NULL, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto next_attr;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri =3D xmlParseU=
RI((const char *) URL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (uri =3D=3D NU=
LL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xml=
NsErr(ctxt, XML_WAR_NS_URI,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;xmlns:%s: &#39;%s&#39; is not a valid URI\n&quot;,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attname, =
URL, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
((ctxt-&gt;pedantic) &amp;&amp; (uri-&gt;scheme =3D=3D NULL)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;xmlns:%s: URI %s is not=
 absolute\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attname, URL, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xml=
FreeURI(uri);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Add the pair to atts<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((atts =3D=3D NULL) || (nbatts + 5 =
&gt; maxatts)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (xmlCtxtGrowAttrs(ctx=
t, nbatts + 5) &lt; 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (attval=
ue[len] =3D=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xmlFree(attvalue);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto faile=
d;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 maxatts =3D ctxt-&gt;max=
atts;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts =3D ctxt-&gt;atts;<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctxt-&gt;attallocs[nratts++] =3D alloc=
;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[nbatts++] =3D attname;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[nbatts++] =3D aprefix;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[nbatts++] =3D NULL; /* the URI wi=
ll be fetched later */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[nbatts++] =3D attvalue;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attvalue +=3D len;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[nbatts++] =3D attvalue;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* tag if some deallocation is ne=
eded<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (alloc !=3D 0) attval =3D 1;<br>
--=C2=A0 =C2=A0 =C2=A0 } else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attvalue !=3D NULL) &amp;&amp; (a=
ttvalue[len] =3D=3D 0))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFree(attvalue);<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* check that it&#39;s not=
 a defined namespace<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 1;j &lt;=3D nbNs;j++=
)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctxt-&gt;nsTa=
b[ctxt-&gt;nsNr - 2 * j] =3D=3D attname)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bre=
ak;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (j &lt;=3D nbNs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlErrAttributeDu=
p(ctxt, aprefix, attname);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nsPush(ctxt, =
attname, URL) &gt; 0) nbNs++;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Add the pair to atts<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((atts =3D=3D NULL) || (nbat=
ts + 5 &gt; maxatts)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (xmlCtxtGrowAt=
trs(ctxt, nbatts + 5) &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 got=
o next_attr;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 maxatts =3D ctxt-=
&gt;maxatts;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts =3D ctxt-&gt=
;atts;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctxt-&gt;attallocs[nratts++] =
=3D alloc;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[nbatts++] =3D attname;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[nbatts++] =3D aprefix;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The namespace URI field=
 is used temporarily to point at the<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* base of the current inp=
ut buffer for non-alloced attributes.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* When the input buffer i=
s reallocated, all the pointers become<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* invalid, but they can b=
e reconstructed later.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (alloc)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[nbatts++] =
=3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[nbatts++] =
=3D ctxt-&gt;input-&gt;base;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[nbatts++] =3D attvalue;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attvalue +=3D len;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[nbatts++] =3D attvalue;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* tag if some deallocatio=
n is needed<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (alloc !=3D 0) attval =3D 1;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attvalue =3D NULL; /* moved int=
o atts */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
--failed:<br>
-+next_attr:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((attvalue !=3D NULL) &amp;&amp; (alloc !=
=3D 0)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFree(attvalue);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attvalue =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GROW<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctxt-&gt;instate =3D=3D XML_PARSER_E=
OF)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
--=C2=A0 =C2=A0 =C2=A0 if ((ctxt-&gt;input-&gt;base !=3D base) || (inputNr =
!=3D ctxt-&gt;inputNr))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto base_changed;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((RAW =3D=3D &#39;&gt;&#39;) || (((RAW =3D=
=3D &#39;/&#39;) &amp;&amp; (NXT(1) =3D=3D &#39;&gt;&#39;))))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!IS_BLANK_CH(RAW)) {<br>
-@@ -9646,8 +9610,20 @@ failed:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GROW;<br>
--=C2=A0 =C2=A0 =C2=A0 if ((ctxt-&gt;input-&gt;base !=3D base) || (inputNr =
!=3D ctxt-&gt;inputNr))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto base_changed;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 /* Reconstruct attribute value pointers. */<br>
-+=C2=A0 =C2=A0 for (i =3D 0, j =3D 0; j &lt; nratts; i +=3D 5, j++) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (atts[i+2] !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Arithmetic on dangling =
pointers is technically undefined<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* behavior, but well...<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptrdiff_t offset =3D ctxt-&gt;i=
nput-&gt;base - atts[i+2];<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[i+2]=C2=A0 =3D NULL;=C2=A0=
 =C2=A0 /* Reset repurposed namespace URI */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[i+3] +=3D offset;=C2=A0 /*=
 value */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atts[i+4] +=3D offset;=C2=A0 /*=
 valuend */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0/*<br>
-@@ -9804,34 +9780,6 @@ failed:<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0return(localname);<br>
--<br>
--base_changed:<br>
--=C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0* the attribute strings are valid iif the base didn&#=
39;t changed<br>
--=C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 if (attval !=3D 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 for (i =3D 3,j =3D 0; j &lt; nratts;i +=3D 5,j++)<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ctxt-&gt;attallocs[j] !=3D 0) &am=
p;&amp; (atts[i] !=3D NULL))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFree((xmlChar *) atts=
[i]);<br>
--=C2=A0 =C2=A0 }<br>
--<br>
--=C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0* We can&#39;t switch from one entity to another in t=
he middle<br>
--=C2=A0 =C2=A0 =C2=A0* of a start tag<br>
--=C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 if (inputNr !=3D ctxt-&gt;inputNr) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFatalErrMsg(ctxt, XML_ERR_ENTITY_BOUNDARY,=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Star=
t tag doesn&#39;t start and stop in the same entity\n&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 return(NULL);<br>
--=C2=A0 =C2=A0 }<br>
--<br>
--=C2=A0 =C2=A0 ctxt-&gt;input-&gt;cur =3D ctxt-&gt;input-&gt;base + cur;<b=
r>
--=C2=A0 =C2=A0 ctxt-&gt;input-&gt;line =3D oldline;<br>
--=C2=A0 =C2=A0 ctxt-&gt;input-&gt;col =3D oldcol;<br>
--=C2=A0 =C2=A0 if (ctxt-&gt;wellFormed =3D=3D 1) {<br>
--=C2=A0 =C2=A0 =C2=A0 goto reparse;<br>
--=C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 return(NULL);<br>
- }<br>
-<br>
- /**<br>
-diff --git a/result/errors/759398.xml.err b/result/errors/759398.xml.err<b=
r>
-index e08d9bf..f6036a3 100644<br>
---- a/result/errors/759398.xml.err<br>
-+++ b/result/errors/759398.xml.err<br>
-@@ -1,9 +1,12 @@<br>
- ./test/errors/759398.xml:210: parser error : StartTag: invalid element na=
me<br>
- need to worry about parsers whi&lt;! don&#39;t expand PErefs finding<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
--./test/errors/759398.xml:<wbr>309: parser error : Opening and ending tag =
mismatch: spec line 50 and termdef<br>
-+./test/errors/759398.xml:<wbr>309: parser error : Opening and ending tag =
mismatch: =E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=
=84=96=E2=84=96=E2=84=96!<br>
=C2=A0=E2=84=96=E2=84=96=E2=84=96<br>
=C2=A0=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96<wbr>=C3=A2!<br>
=C2=A0=EF=BF=BD=EF=BF=BD=E2=84=96=E2=84=96=C3=A2<br>
=C2=A0=EF=BF=BD=EF=BF=BD=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=EF=BF=BD=E2=80=9E!<br>
=C2=A0=EF=BF=BD=E2=84=96=E2=84=96=EF=BF=BD=E2=80=9E<br>
=C2=A0=EF=BF=BD=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96<wbr>=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96<wbr>=E2=84=96=E2=84=
=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=
=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=84=96=E2=
=84=96m line 308 and termdef<br>
- and provide access to their content and structure.&lt;/termdef&gt; &lt;te=
rmdef<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
--./test/errors/759398.xml:<wbr>309: parser error : Extra content at the en=
d of the document<br>
--and provide access to their content and structure.&lt;/termdef&gt; &lt;te=
rmdef<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
-+./test/errors/759398.xml:<wbr>314: parser error : Opening and ending tag =
mismatch: spec line 50 and p<br>
-+data and the information it must provide to the application.&lt;/p&gt;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^<br>
-+./test/errors/759398.xml:<wbr>316: parser error : Extra content at the en=
d of the document<br>
-+&lt;div2 id=3D&#39;sec-origin-goals&#39;&gt;<br>
-+^<br>
-diff --git a/result/errors/attr1.xml.err b/result/errors/attr1.xml.err<br>
-index 4f08538..c4c4fc8 100644<br>
---- a/result/errors/attr1.xml.err<br>
-+++ b/result/errors/attr1.xml.err<br>
-@@ -1,6 +1,9 @@<br>
- ./test/errors/attr1.xml:2: parser error : AttValue: &#39; expected<br>
-<br>
- ^<br>
--./test/errors/attr1.xml:1: parser error : Extra content at the end of the=
 document<br>
--&lt;foo foo=3D&quot;<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooo=
ooooooooooooooooo<wbr>oooooooooo<br>
-- ^<br>
-+./test/errors/attr1.xml:2: parser error : attributes construct error<br>
-+<br>
-+^<br>
-+./test/errors/attr1.xml:2: parser error : Couldn&#39;t find end of Start =
Tag foo line 1<br>
-+<br>
-+^<br>
-diff --git a/result/errors/attr2.xml.err b/result/errors/attr2.xml.err<br>
-index c8a9c7d..77e342e 100644<br>
---- a/result/errors/attr2.xml.err<br>
-+++ b/result/errors/attr2.xml.err<br>
-@@ -1,6 +1,9 @@<br>
- ./test/errors/attr2.xml:2: parser error : AttValue: &#39; expected<br>
-<br>
- ^<br>
--./test/errors/attr2.xml:1: parser error : Extra content at the end of the=
 document<br>
--&lt;foo foo=3D&quot;&gt;<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>ooooooooo<br>
-- ^<br>
-+./test/errors/attr2.xml:2: parser error : attributes construct error<br>
-+<br>
-+^<br>
-+./test/errors/attr2.xml:2: parser error : Couldn&#39;t find end of Start =
Tag foo line 1<br>
-+<br>
-+^<br>
-diff --git a/result/errors/name2.xml.err b/result/errors/name2.xml.err<br>
-index a6649a1..8a6acee 100644<br>
---- a/result/errors/name2.xml.err<br>
-+++ b/result/errors/name2.xml.err<br>
-@@ -1,6 +1,9 @@<br>
- ./test/errors/name2.xml:2: parser error : Specification mandate value for=
 attribute fooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooooooooooooo=
o<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooo=
oooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooo=
oooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooo=
ooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooo=
oooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooooooooooooo=
o<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooo=
oooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooo=
oooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooo=
ooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooo=
oooooo<wbr>ooo!<br>
=C2=A0ooooooooo<br>
=C2=A0oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooo=
oooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooo=
oooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooo=
ooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooo=
oooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooooooooooooo=
o<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooo=
oooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooo=
oooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooo=
ooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooo=
oooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooooooooooooo=
o<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooo!<br>
=C2=A0ooooooooo<br>
=C2=A0oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooo=
oooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooo=
oooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooo=
ooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooo=
oooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooooooooooooo=
o<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooo=
oooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooo=
oooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooo=
ooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooo=
oooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooooooooooooo=
o<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooo!<br>
=C2=A0ooooooooo<br>
=C2=A0oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooo=
oooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooo=
oooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooo=
ooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooo=
oooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooooooooooooo=
o<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooo=
oooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooo=
oooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooo=
ooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooo=
oooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooooooooooooo=
o<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooo!<br>
=C2=A0ooooooooo<br>
=C2=A0oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooo=
oooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooo=
oooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooo=
ooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooo=
oooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooooooooooooo=
o<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooo=
oooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooo=
oooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooo=
ooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooo=
oooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooooooooooooo=
o<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooo!<br>
=C2=A0ooooooooo<br>
=C2=A0oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooo=
oooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooo=
oooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooo=
ooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooo=
oooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooooooooooooooooooooooo=
o<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr=
>oooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooo=
oooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>ooooooooo=
ooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo<wbr>oooooooooooooo=
oooooooooooooooo<wbr>ooooooooooooooooooooo<br>
-<br>
- ^<br>
--./test/errors/name2.xml:1: parser error : Extra content at the end of the=
 document<br>
--&lt;foo fooooooooooooooooooooooooooooo<wbr>oooooooooooooooooooooooooooooo=
<wbr>ooooooooooooooo<br>
-- ^<br>
-+./test/errors/name2.xml:2: parser error : attributes construct error<br>
-+<br>
-+^<br>
-+./test/errors/name2.xml:2: parser error : Couldn&#39;t find end of Start =
Tag foo line 1<br>
-+<br>
-+^<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_node_<wbr>co=
mparison.patch b/meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_node_<wb=
r>comparison.patch<br>
deleted file mode 100644<br>
index 65f6bef..0000000<br>
--- a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_node_<wbr>compariso=
n.patch<br>
+++ /dev/null<br>
@@ -1,67 +0,0 @@<br>
-libxml2-2.9.4: Fix comparison with root node in xmlXPathCmpNodes and NULL =
pointer deref in XPointer<br>
-<br>
-xpath:<br>
- - Check for errors after evaluating first operand.<br>
- - Add sanity check for empty stack.<br>
- - Include comparation in changes from xmlXPathCmpNodesExt to xmlXPathCmpN=
odes<br>
-<br>
-Upstream-Status: Backport<br>
- - [<a href=3D"https://git.gnome.org/browse/libxml2/commit/?id=3Dc1d1f7121=
194036608bf555f08d3062a36fd344b" rel=3D"noreferrer" target=3D"_blank">https=
://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D<wbr>c1d1f7121194036608bf=
555f08d306<wbr>2a36fd344b</a>]<br>
- - [<a href=3D"https://git.gnome.org/browse/libxml2/commit/?id=3Da00519933=
0b86dada19d162cae15ef9bdcb6baa8" rel=3D"noreferrer" target=3D"_blank">https=
://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D<wbr>a005199330b86dada19d=
162cae15ef<wbr>9bdcb6baa8</a>]<br>
-CVE: CVE-2016-5131<br>
-Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
">andrej.valek@siemens.com</a>&gt;<br>
-Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">=
pascal.bach@siemens.com</a>&gt;<br>
-<br>
-diff --git a/result/XPath/xptr/viderror b/result/XPath/xptr/viderror<br>
-new file mode 100644<br>
-index 0000000..d589882<br>
---- /dev/null<br>
-+++ b/result/XPath/xptr/viderror<br>
-@@ -0,0 +1,4 @@<br>
-+<br>
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<=
br>
-+Expression: xpointer(non-existing-fn()/<wbr>range-to(id(&#39;chapter2&#39=
;)))<br>
-+Object is empty (NULL)<br>
-diff --git a/test/XPath/xptr/viderror b/test/XPath/xptr/viderror<br>
-new file mode 100644<br>
-index 0000000..da8c53b<br>
---- /dev/null<br>
-+++ b/test/XPath/xptr/viderror<br>
-@@ -0,0 +1 @@<br>
-+xpointer(non-existing-fn()/<wbr>range-to(id(&#39;chapter2&#39;)))<br>
-diff --git a/xpath.c b/xpath.c<br>
-index 113bce6..d992841 100644<br>
---- a/xpath.c<br>
-+++ b/xpath.c<br>
-@@ -3342,13 +3342,13 @@ xmlXPathCmpNodes(xmlNodePtr node1, xmlNodePtr node=
2) {<br>
-=C2=A0 =C2=A0 =C2=A0 * compute depth to root<br>
-=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0for (depth2 =3D 0, cur =3D node2;cur-&gt;parent !=3D N=
ULL;cur =3D cur-&gt;parent) {<br>
--=C2=A0 =C2=A0 =C2=A0 if (cur =3D=3D node1)<br>
-+=C2=A0 =C2=A0 =C2=A0 if (cur-&gt;parent =3D=3D node1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return(1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depth2++;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0root =3D cur;<br>
-=C2=A0 =C2=A0 =C2=A0for (depth1 =3D 0, cur =3D node1;cur-&gt;parent !=3D N=
ULL;cur =3D cur-&gt;parent) {<br>
--=C2=A0 =C2=A0 =C2=A0 if (cur =3D=3D node2)<br>
-+=C2=A0 =C2=A0 =C2=A0 if (cur-&gt;parent =3D=3D node2)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return(-1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depth1++;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-@@ -14005,9 +14005,14 @@ xmlXPathCompOpEval(<wbr>xmlXPathParserContextPtr =
ctxt, xmlXPathStepOpPtr op)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlNodeSetPt=
r oldset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int i, j;<br=
>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (op-&gt;ch1 !=
=3D -1)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (op-&gt;ch1 !=
=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0total +=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0xmlXPathCompOpEval(ctxt, &amp;comp-&gt;steps[op-&gt;ch1]);=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CHE=
CK_ERROR0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctxt-&gt;valu=
e =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XP_=
ERROR0(XPATH_INVALID_<wbr>OPERAND);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (op-&gt;c=
h2 =3D=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return (total);<br>
-<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/runtest.patch b/meta/rec=
ipes-core/libxml/<wbr>libxml2/runtest.patch<br>
</div></div>index 6e56857..cb171d5 100644<br>
--- a/meta/recipes-core/libxml/<wbr>libxml2/runtest.patch<br>
+++ b/meta/recipes-core/libxml/<wbr>libxml2/runtest.patch<br>
@@ -2,47 +2,29 @@ Add &#39;install-ptest&#39; rule.<br>
<span class=3D"">=C2=A0Print a standard result line for each test.<br>
<br>
=C2=A0Signed-off-by: Mihaela Sendrea &lt;<a href=3D"mailto:mihaela.sendrea@=
enea.com">mihaela.sendrea@enea.com</a>&gt;<br>
-Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@enea.com">a=
ndrej.valek@enea.com</a>&gt;<br>
+Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
">andrej.valek@siemens.com</a>&gt;<br>
=C2=A0Upstream-Status: Backport<br>
<br>
=C2=A0diff -uNr a/Makefile.am b/Makefile.am<br>
---- a/Makefile.am=C2=A0 =C2=A0 =C2=A0 2016-05-22 03:49:02.000000000 +0200<=
br>
-+++ b/Makefile.am=C2=A0 =C2=A0 =C2=A0 2017-06-14 10:38:43.381305385 +0200<=
br>
-@@ -202,10 +202,24 @@<br>
+--- a/Makefile.am=C2=A0 =C2=A0 =C2=A0 2017-08-28 15:01:14.000000000 +0200<=
br>
++++ b/Makefile.am=C2=A0 =C2=A0 =C2=A0 2017-09-05 08:06:05.752287323 +0200<=
br>
+@@ -202,6 +202,15 @@<br>
=C2=A0 #testOOM_DEPENDENCIES =3D $(DEPS)<br>
=C2=A0 #testOOM_LDADD=3D $(LDADDS)<br>
<br>
</span>=C2=A0+install-ptest:<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 @(if [ -d .libs ] ; then cd .libs; fi; \<br>
<span class=3D"">-+=C2=A0 =C2=A0 =C2=A0 install $(noinst_PROGRAMS) $(DESTDI=
R))<br>
++=C2=A0 =C2=A0 =C2=A0 install $(check_PROGRAMS) $(DESTDIR))<br>
</span>=C2=A0+=C2=A0 =C2=A0 =C2=A0 cp -r $(srcdir)/test $(DESTDIR)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 cp -r $(srcdir)/result $(DESTDIR)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 cp -r $(srcdir)/python $(DESTDIR)<br>
<div class=3D"HOEnZb"><div class=3D"h5">=C2=A0+=C2=A0 =C2=A0 =C2=A0 cp Make=
file $(DESTDIR)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s|^Makefile:|_Makefile:|&#39; $(=
DESTDIR)/Makefile<br>
=C2=A0+<br>
- runtests:<br>
+ runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testchar$(EXEEXT) testdict$(EXEEX=
T) runxmlconf$(EXEEXT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -d test=C2=A0 =C2=A0] || $(LN_S) $(srcdir)/te=
st=C2=A0 =C2=A0.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -d result ] || $(LN_S) $(srcdir)/result .<br>
--=C2=A0 =C2=A0 =C2=A0 $(CHECKER) ./runtest$(EXEEXT) &amp;&amp; $(CHECKER) =
./testrecurse$(EXEEXT) &amp;&amp;$(CHECKER) ./testapi$(EXEEXT) &amp;&amp; $=
(CHECKER) ./testchar$(EXEEXT)&amp;&amp; $(CHECKER) ./testdict$(EXEEXT) &amp=
;&amp; $(CHECKER) ./runxmlconf$(EXEEXT)<br>
-+=C2=A0 =C2=A0 =C2=A0 $(CHECKER) ./runtest$(EXEEXT) &amp;&amp; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CHECKER) ./testrecurse$(EXEEXT) &amp=
;&amp; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASAN_OPTIONS=3D&quot;$$ASAN_OPTIONS:<w=
br>detect_leaks=3D0&quot; $(CHECKER) ./testapi$(EXEEXT) &amp;&amp; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CHECKER) ./testchar$(EXEEXT) &amp;&a=
mp; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CHECKER) ./testdict$(EXEEXT) &amp;&a=
mp; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CHECKER) ./runxmlconf$(EXEEXT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@(if [ &quot;$(PYTHON_SUBDIR)&quot; !=3D &quot;=
&quot; ] ; then cd python ; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) tests ; fi)<br>
-<br>
-@@ -229,7 +243,7 @@<br>
-<br>
- APItests: testapi$(EXEEXT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;## Running the API regression tests=
 this may take a little while&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 -@($(CHECKER) $(top_builddir)/testapi -q)<br>
-+=C2=A0 =C2=A0 =C2=A0 -@(ASAN_OPTIONS=3D&quot;$$ASAN_<wbr>OPTIONS:detect_l=
eaks=3D0&quot; $(CHECKER) $(top_builddir)/testapi -q)<br>
-<br>
- HTMLtests : testHTML$(EXEEXT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@(echo &gt; .memdump)<br>
+<br>
=C2=A0diff -uNr a/runsuite.c b/runsuite.c<br>
=C2=A0--- a/runsuite.c=C2=A0 =C2=A0 =C2=A0 =C2=A02013-04-12 16:17:11.462823=
238 +0200<br>
=C2=A0+++ b/runsuite.c=C2=A0 =C2=A0 =C2=A0 =C2=A02013-04-17 14:07:24.352693=
211 +0200<br>
diff --git a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.4.bb" r=
el=3D"noreferrer" target=3D"_blank">lib<wbr>xml2_2.9.4.bb</a> b/meta/recipe=
s-core/libxml/<a href=3D"http://libxml2_2.9.5.bb" rel=3D"noreferrer" target=
=3D"_blank">lib<wbr>xml2_2.9.5.bb</a><br>
similarity index 85%<br>
rename from meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.4.bb" re=
l=3D"noreferrer" target=3D"_blank">libxm<wbr>l2_2.9.4.bb</a><br>
rename to meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libxm<wbr>l2_2.9.5.bb</a><br>
index 107539b..16391c3 100644<br>
--- a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>xml2_2.9.4.bb</a><br>
+++ b/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>xml2_2.9.5.bb</a><br>
@@ -19,21 +19,11 @@ SRC_URI =3D &quot;<a href=3D"ftp://xmlsoft.org/libxml2/=
libxml2-${PV}.tar.gz;name=3Dlibtar" rel=3D"noreferrer" target=3D"_blank">ft=
p://xmlsoft.org/libxml2/<wbr>libxml2-${PV}.tar.gz;name=3D<wbr>libtar</a> \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://python-sitepackages-<wbr>d=
ir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libxml-m4-use-<wbr>pkgconf=
ig.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml2-fix_node_<wbr>comp=
arison.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml2-CVE-2016-5131.<wbr=
>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml2-CVE-2016-4658.<wbr=
>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml2-fix_NULL_<wbr>poin=
ter_derefs.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml2-fix_and_<wbr>simpl=
ify_xmlParseStartTag2.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml2-CVE-2017-9047_<wbr=
>CVE-2017-9048.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml2-CVE-2017-9049_<wbr=
>CVE-2017-9050.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml2-CVE-2017-5969.<wbr=
>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml2-CVE-2017-0663.<wbr=
>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml2-CVE-2017-8872.<wbr=
>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Make-ptest-run-<wbr>t=
he-python-tests-if-python-is-<wbr>enabled.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[libtar.md5sum] =3D &quot;<wbr>ae249165c173b1ff386ee8ad676815<wbr>f=
5&quot;<br>
-SRC_URI[libtar.sha256sum] =3D &quot;<wbr>ffb911191e509b966deb55de705387<wb=
r>f14156e1a56b21824357cdf0053233<wbr>633c&quot;<br>
+SRC_URI[libtar.md5sum] =3D &quot;<wbr>5ce0da9bdaa267b40c4ca36d35363b<wbr>8=
b&quot;<br>
+SRC_URI[libtar.sha256sum] =3D &quot;<wbr>4031c1ecee9ce7ba4f313e91ef6284<wb=
r>164885cdb69937a123f6a83bb6a72d<wbr>cd38&quot;<br>
=C2=A0SRC_URI[testtar.md5sum] =3D &quot;<wbr>ae3d1ebe000a3972afa104ca7f0e1b=
<wbr>4a&quot;<br>
=C2=A0SRC_URI[testtar.sha256sum] =3D &quot;<wbr>96151685cec997e1f9f3387e362=
6d6<wbr>1e6284d4d6e66e0e440c209286c03e<wbr>9cc7&quot;<br>
<br>
--<br>
2.1.4<br>
<br>
</div></div><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a113ff7d0dfd1c0055a42418a--
