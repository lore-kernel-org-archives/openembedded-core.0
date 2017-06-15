Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3141A78315
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 12:15:35 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id u12so17740608qth.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 05:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z8Z4r4St1H8fRqU2gQWga7vjQGOias2XafAQL8+B0Q4=;
	b=mTU1onTf/Rr1cJa2TJt+4oU8V73mrMAO81jCwrWbYvFgv4eKtz5qaFXXXobCs7unUr
	gf7c057JPtqEFU1bzUO+Gv0G9p1H99uL/wdE7mHL4oVMpzxv5SZQRlVKJqOe3JZZpoWs
	yhAUvcFo+W4AEjVha+nXpiZ+4SRhKyinAniY5J6A3H9fk7rfWd5OPWVhlR5xdaBaapiM
	cuTlUI+ZjsDKk9dVvO95ECU0Oo4OxEpLL+18nLPLXjNqNIC5AoAd5Nvr0UQ8rxs3nIXK
	8127FRtPtwitzX8TkBZr28HLANkIlf9aeigdmgp0DqVB2ClIQmWB0m+D8zm6kkGiNrkn
	BPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z8Z4r4St1H8fRqU2gQWga7vjQGOias2XafAQL8+B0Q4=;
	b=Yyacn3jV/GXPB9HzllNlGsiXLIhHGaYQRYHdVmAdyVYO6jvhcqqiQ+A+fTotLjzTze
	YyFBRGR9XCwFaOjL2s2FjACtSrwb9pU7kPzDAJnRkHoRglgFPhR2ysooMZnlnfuOgC12
	VDlI4VtRdrLjG2TLTz27YTgM45fnqQnOS8MXmo9tasShU4GcBSkvr5q/a79UcdO5Bes8
	j0/IhrGWXm0LK1cjzEg8LTH6BC/wie8LF2SK1PQlkTkm1K3XJMDmIhKkCCIynrqmber9
	WRzTrgx6DChjgh3H8LwVqNxOI78FC4UooNc53XJgYbiWuGeMMia8HTNOjvnS+dfA1HOg
	62AQ==
X-Gm-Message-State: AKS2vOzLTJyRQ5fM4PKVORV6y4GGb5De64pQw1XbiWs1NvwLbnN/Uv88
	FApl2JP9Eqb4q5e4x/kgF7Zvyk6Qj/qC
X-Received: by 10.55.31.162 with SMTP id n34mr5909049qkh.46.1497528936964;
	Thu, 15 Jun 2017 05:15:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 05:15:16 -0700 (PDT)
In-Reply-To: <1497528519-19425-3-git-send-email-andrej.valek@siemens.com>
References: <1497528519-19425-1-git-send-email-andrej.valek@siemens.com>
	<1497528519-19425-3-git-send-email-andrej.valek@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 13:15:16 +0100
Message-ID: <CAJTo0LajDiDoMXaUFzfPJ5Tb_YhTg5-xkN440hkCfhG5Ff7m7A@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/7] libxml2: Avoid reparsing and simplify control flow in xmlParseStartTag2
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
X-List-Received-Date: Thu, 15 Jun 2017 12:15:36 -0000
Content-Type: multipart/alternative; boundary="001a1147e5f85436e40551fea0d1"

--001a1147e5f85436e40551fea0d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch won't apply, probably because of the crazy encodings.  Can you
push the series to a branch?

Ross

On 15 June 2017 at 13:08, Andrej Valek <andrej.valek@siemens.com> wrote:

> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...ibxml2-fix_and_simplify_xmlParseStartTag2.patch | 590
> +++++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.9.4.bb          |   1 +
>  2 files changed, 591 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_and_
> simplify_xmlParseStartTag2.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix_and_
> simplify_xmlParseStartTag2.patch b/meta/recipes-core/libxml/
> libxml2/libxml2-fix_and_simplify_xmlParseStartTag2.patch
> new file mode 100644
> index 0000000..faa5770
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/libxml2-fix_and_
> simplify_xmlParseStartTag2.patch
> @@ -0,0 +1,590 @@
> +libxml2-2.9.4: Avoid reparsing and simplify control flow in
> xmlParseStartTag2
> +
> +[No upstream tracking]
> +
> +parser: Avoid reparsing in xmlParseStartTag2
> +
> +The code in xmlParseStartTag2 must handle the case that the input
> +buffer was grown and reallocated which can invalidate pointers to
> +attribute values. Before, this was handled by detecting changes of
> +the input buffer "base" pointer and, in case of a change, jumping
> +back to the beginning of the function and reparsing the start tag.
> +
> +The major problem of this approach is that whether an input buffer is
> +reallocated is nondeterministic, resulting in seemingly random test
> +failures. See the mailing list thread "runtest mystery bug: name2.xml
> +error case regression test" from 2012, for example.
> +
> +If a reallocation was detected, the code also made no attempts to
> +continue parsing in case of errors which makes a difference in
> +the lax "recover" mode.
> +
> +Now we store the current input buffer "base" pointer for each (not
> +separately allocated) attribute in the namespace URI field, which isn't
> +used until later. After the whole start tag was parsed, the pointers to
> +the attribute values are reconstructed using the offset between the
> +new and the old input buffer. This relies on arithmetic on dangling
> +pointers which is technically undefined behavior. But it seems like
> +the easiest and most efficient fix and a similar approach is used in
> +xmlParserInputGrow.
> +
> +This changes the error output of several tests, typically making it
> +more verbose because we try harder to continue parsing in case of errors=
.
> +
> +(Another possible solution is to check not only the "base" pointer
> +but the size of the input buffer as well. But this would result in
> +even more reparsing.)
> +
> +Remove some goto labels and deduplicate a bit of code after handling
> +namespaces.
> +
> +There were two bugs where parameter-entity references could lead to an
> +unexpected change of the input buffer in xmlParseNameComplex and
> +xmlDictLookup being called with an invalid pointer.
> +
> +
> +Upstream-Status: Backport
> + - [https://git.gnome.org/browse/libxml2/commit/?id=3D
> 07b7428b69c368611d215a140fe630b2d1e61349]
> + - [https://git.gnome.org/browse/libxml2/commit/?id=3D
> 855c19efb7cd30d927d673b3658563c4959ca6f0]
> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> +
> +diff --git a/parser.c b/parser.c
> +index 609a270..74016e3 100644
> +--- a/parser.c
> ++++ b/parser.c
> +@@ -43,6 +43,7 @@
> + #include <limits.h>
> + #include <string.h>
> + #include <stdarg.h>
> ++#include <stddef.h>
> + #include <libxml/xmlmemory.h>
> + #include <libxml/threads.h>
> + #include <libxml/globals.h>
> +@@ -9377,8 +9378,7 @@ xmlParseStartTag2(xmlParserCtxtPtr ctxt, const
> xmlChar **pref,
> +     const xmlChar **atts =3D ctxt->atts;
> +     int maxatts =3D ctxt->maxatts;
> +     int nratts, nbatts, nbdef;
> +-    int i, j, nbNs, attval, oldline, oldcol, inputNr;
> +-    const xmlChar *base;
> ++    int i, j, nbNs, attval;
> +     unsigned long cur;
> +     int nsNr =3D ctxt->nsNr;
> +
> +@@ -9392,13 +9392,8 @@ xmlParseStartTag2(xmlParserCtxtPtr ctxt, const
> xmlChar **pref,
> +      *       The Shrinking is only possible once the full set of
> attribute
> +      *       callbacks have been done.
> +      */
> +-reparse:
> +     SHRINK;
> +-    base =3D ctxt->input->base;
> +     cur =3D ctxt->input->cur - ctxt->input->base;
> +-    inputNr =3D ctxt->inputNr;
> +-    oldline =3D ctxt->input->line;
> +-    oldcol =3D ctxt->input->col;
> +     nbatts =3D 0;
> +     nratts =3D 0;
> +     nbdef =3D 0;
> +@@ -9422,8 +9417,6 @@ reparse:
> +      */
> +     SKIP_BLANKS;
> +     GROW;
> +-    if ((ctxt->input->base !=3D base) || (inputNr !=3D ctxt->inputNr))
> +-        goto base_changed;
> +
> +     while (((RAW !=3D '>') &&
> +          ((RAW !=3D '/') || (NXT(1) !=3D '>')) &&
> +@@ -9434,203 +9427,174 @@ reparse:
> +
> +       attname =3D xmlParseAttribute2(ctxt, prefix, localname,
> +                                    &aprefix, &attvalue, &len, &alloc);
> +-      if ((ctxt->input->base !=3D base) || (inputNr !=3D ctxt->inputNr)=
) {
> +-          if ((attvalue !=3D NULL) && (alloc !=3D 0))
> +-              xmlFree(attvalue);
> +-          attvalue =3D NULL;
> +-          goto base_changed;
> +-      }
> +-        if ((attname !=3D NULL) && (attvalue !=3D NULL)) {
> +-          if (len < 0) len =3D xmlStrlen(attvalue);
> +-            if ((attname =3D=3D ctxt->str_xmlns) && (aprefix =3D=3D NUL=
L)) {
> +-              const xmlChar *URL =3D xmlDictLookup(ctxt->dict, attvalue=
,
> len);
> +-              xmlURIPtr uri;
> +-
> +-                if (URL =3D=3D NULL) {
> +-                  xmlErrMemory(ctxt, "dictionary allocation failure");
> +-                  if ((attvalue !=3D NULL) && (alloc !=3D 0))
> +-                      xmlFree(attvalue);
> +-                  return(NULL);
> +-              }
> +-                if (*URL !=3D 0) {
> +-                  uri =3D xmlParseURI((const char *) URL);
> +-                  if (uri =3D=3D NULL) {
> +-                      xmlNsErr(ctxt, XML_WAR_NS_URI,
> +-                               "xmlns: '%s' is not a valid URI\n",
> +-                                         URL, NULL, NULL);
> +-                  } else {
> +-                      if (uri->scheme =3D=3D NULL) {
> +-                          xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,
> +-                                    "xmlns: URI %s is not absolute\n",
> +-                                    URL, NULL, NULL);
> +-                      }
> +-                      xmlFreeURI(uri);
> +-                  }
> +-                  if (URL =3D=3D ctxt->str_xml_ns) {
> +-                      if (attname !=3D ctxt->str_xml) {
> +-                          xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> +-                       "xml namespace URI cannot be the default
> namespace\n",
> +-                                   NULL, NULL, NULL);
> +-                      }
> +-                      goto skip_default_ns;
> +-                  }
> +-                  if ((len =3D=3D 29) &&
> +-                      (xmlStrEqual(URL,
> +-                               BAD_CAST "http://www.w3.org/2000/xmlns/"=
)))
> {
> +-                      xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> +-                           "reuse of the xmlns namespace name is
> forbidden\n",
> +-                               NULL, NULL, NULL);
> +-                      goto skip_default_ns;
> +-                  }
> +-              }
> +-              /*
> +-               * check that it's not a defined namespace
> +-               */
> +-              for (j =3D 1;j <=3D nbNs;j++)
> +-                  if (ctxt->nsTab[ctxt->nsNr - 2 * j] =3D=3D NULL)
> +-                      break;
> +-              if (j <=3D nbNs)
> +-                  xmlErrAttributeDup(ctxt, NULL, attname);
> +-              else
> +-                  if (nsPush(ctxt, NULL, URL) > 0) nbNs++;
> +-skip_default_ns:
> +-              if ((attvalue !=3D NULL) && (alloc !=3D 0)) {
> +-                  xmlFree(attvalue);
> +-                  attvalue =3D NULL;
> +-              }
> +-              if ((RAW =3D=3D '>') || (((RAW =3D=3D '/') && (NXT(1) =3D=
=3D '>'))))
> +-                  break;
> +-              if (!IS_BLANK_CH(RAW)) {
> +-                  xmlFatalErrMsg(ctxt, XML_ERR_SPACE_REQUIRED,
> +-                                 "attributes construct error\n");
> +-                  break;
> +-              }
> +-              SKIP_BLANKS;
> +-              if ((ctxt->input->base !=3D base) || (inputNr !=3D
> ctxt->inputNr))
> +-                  goto base_changed;
> +-              continue;
> +-          }
> +-            if (aprefix =3D=3D ctxt->str_xmlns) {
> +-              const xmlChar *URL =3D xmlDictLookup(ctxt->dict, attvalue=
,
> len);
> +-              xmlURIPtr uri;
> +-
> +-                if (attname =3D=3D ctxt->str_xml) {
> +-                  if (URL !=3D ctxt->str_xml_ns) {
> +-                      xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> +-                               "xml namespace prefix mapped to wrong
> URI\n",
> +-                               NULL, NULL, NULL);
> +-                  }
> +-                  /*
> +-                   * Do not keep a namespace definition node
> +-                   */
> +-                  goto skip_ns;
> +-              }
> ++        if ((attname =3D=3D NULL) || (attvalue =3D=3D NULL))
> ++            goto next_attr;
> ++      if (len < 0) len =3D xmlStrlen(attvalue);
> ++
> ++        if ((attname =3D=3D ctxt->str_xmlns) && (aprefix =3D=3D NULL)) =
{
> ++            const xmlChar *URL =3D xmlDictLookup(ctxt->dict, attvalue,
> len);
> ++            xmlURIPtr uri;
> ++
> ++            if (URL =3D=3D NULL) {
> ++                xmlErrMemory(ctxt, "dictionary allocation failure");
> ++                if ((attvalue !=3D NULL) && (alloc !=3D 0))
> ++                    xmlFree(attvalue);
> ++                return(NULL);
> ++            }
> ++            if (*URL !=3D 0) {
> ++                uri =3D xmlParseURI((const char *) URL);
> ++                if (uri =3D=3D NULL) {
> ++                    xmlNsErr(ctxt, XML_WAR_NS_URI,
> ++                             "xmlns: '%s' is not a valid URI\n",
> ++                                       URL, NULL, NULL);
> ++                } else {
> ++                    if (uri->scheme =3D=3D NULL) {
> ++                        xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,
> ++                                  "xmlns: URI %s is not absolute\n",
> ++                                  URL, NULL, NULL);
> ++                    }
> ++                    xmlFreeURI(uri);
> ++                }
> +                 if (URL =3D=3D ctxt->str_xml_ns) {
> +-                  if (attname !=3D ctxt->str_xml) {
> +-                      xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> +-                               "xml namespace URI mapped to wrong
> prefix\n",
> +-                               NULL, NULL, NULL);
> +-                  }
> +-                  goto skip_ns;
> +-              }
> +-                if (attname =3D=3D ctxt->str_xmlns) {
> +-                  xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> +-                           "redefinition of the xmlns prefix is
> forbidden\n",
> +-                           NULL, NULL, NULL);
> +-                  goto skip_ns;
> +-              }
> +-              if ((len =3D=3D 29) &&
> +-                  (xmlStrEqual(URL,
> +-                               BAD_CAST "http://www.w3.org/2000/xmlns/"=
)))
> {
> +-                  xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> +-                           "reuse of the xmlns namespace name is
> forbidden\n",
> +-                           NULL, NULL, NULL);
> +-                  goto skip_ns;
> +-              }
> +-              if ((URL =3D=3D NULL) || (URL[0] =3D=3D 0)) {
> +-                  xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> +-                           "xmlns:%s: Empty XML namespace is not
> allowed\n",
> +-                                attname, NULL, NULL);
> +-                  goto skip_ns;
> +-              } else {
> +-                  uri =3D xmlParseURI((const char *) URL);
> +-                  if (uri =3D=3D NULL) {
> +-                      xmlNsErr(ctxt, XML_WAR_NS_URI,
> +-                           "xmlns:%s: '%s' is not a valid URI\n",
> +-                                         attname, URL, NULL);
> +-                  } else {
> +-                      if ((ctxt->pedantic) && (uri->scheme =3D=3D NULL)=
) {
> +-                          xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,
> +-                                    "xmlns:%s: URI %s is not absolute\n=
",
> +-                                    attname, URL, NULL);
> +-                      }
> +-                      xmlFreeURI(uri);
> +-                  }
> +-              }
> +-
> +-              /*
> +-               * check that it's not a defined namespace
> +-               */
> +-              for (j =3D 1;j <=3D nbNs;j++)
> +-                  if (ctxt->nsTab[ctxt->nsNr - 2 * j] =3D=3D attname)
> +-                      break;
> +-              if (j <=3D nbNs)
> +-                  xmlErrAttributeDup(ctxt, aprefix, attname);
> +-              else
> +-                  if (nsPush(ctxt, attname, URL) > 0) nbNs++;
> +-skip_ns:
> +-              if ((attvalue !=3D NULL) && (alloc !=3D 0)) {
> +-                  xmlFree(attvalue);
> +-                  attvalue =3D NULL;
> +-              }
> +-              if ((RAW =3D=3D '>') || (((RAW =3D=3D '/') && (NXT(1) =3D=
=3D '>'))))
> +-                  break;
> +-              if (!IS_BLANK_CH(RAW)) {
> +-                  xmlFatalErrMsg(ctxt, XML_ERR_SPACE_REQUIRED,
> +-                                 "attributes construct error\n");
> +-                  break;
> +-              }
> +-              SKIP_BLANKS;
> +-              if ((ctxt->input->base !=3D base) || (inputNr !=3D
> ctxt->inputNr))
> +-                  goto base_changed;
> +-              continue;
> +-          }
> ++                    if (attname !=3D ctxt->str_xml) {
> ++                        xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> ++                     "xml namespace URI cannot be the default
> namespace\n",
> ++                                 NULL, NULL, NULL);
> ++                    }
> ++                    goto next_attr;
> ++                }
> ++                if ((len =3D=3D 29) &&
> ++                    (xmlStrEqual(URL,
> ++                             BAD_CAST "http://www.w3.org/2000/xmlns/"))=
)
> {
> ++                    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> ++                         "reuse of the xmlns namespace name is
> forbidden\n",
> ++                             NULL, NULL, NULL);
> ++                    goto next_attr;
> ++                }
> ++            }
> ++            /*
> ++             * check that it's not a defined namespace
> ++             */
> ++            for (j =3D 1;j <=3D nbNs;j++)
> ++                if (ctxt->nsTab[ctxt->nsNr - 2 * j] =3D=3D NULL)
> ++                    break;
> ++            if (j <=3D nbNs)
> ++                xmlErrAttributeDup(ctxt, NULL, attname);
> ++            else
> ++                if (nsPush(ctxt, NULL, URL) > 0) nbNs++;
> ++
> ++        } else if (aprefix =3D=3D ctxt->str_xmlns) {
> ++            const xmlChar *URL =3D xmlDictLookup(ctxt->dict, attvalue,
> len);
> ++            xmlURIPtr uri;
> ++
> ++            if (attname =3D=3D ctxt->str_xml) {
> ++                if (URL !=3D ctxt->str_xml_ns) {
> ++                    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> ++                             "xml namespace prefix mapped to wrong
> URI\n",
> ++                             NULL, NULL, NULL);
> ++                }
> ++                /*
> ++                 * Do not keep a namespace definition node
> ++                 */
> ++                goto next_attr;
> ++            }
> ++            if (URL =3D=3D ctxt->str_xml_ns) {
> ++                if (attname !=3D ctxt->str_xml) {
> ++                    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> ++                             "xml namespace URI mapped to wrong
> prefix\n",
> ++                             NULL, NULL, NULL);
> ++                }
> ++                goto next_attr;
> ++            }
> ++            if (attname =3D=3D ctxt->str_xmlns) {
> ++                xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> ++                         "redefinition of the xmlns prefix is
> forbidden\n",
> ++                         NULL, NULL, NULL);
> ++                goto next_attr;
> ++            }
> ++            if ((len =3D=3D 29) &&
> ++                (xmlStrEqual(URL,
> ++                             BAD_CAST "http://www.w3.org/2000/xmlns/"))=
)
> {
> ++                xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> ++                         "reuse of the xmlns namespace name is
> forbidden\n",
> ++                         NULL, NULL, NULL);
> ++                goto next_attr;
> ++            }
> ++            if ((URL =3D=3D NULL) || (URL[0] =3D=3D 0)) {
> ++                xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
> ++                         "xmlns:%s: Empty XML namespace is not
> allowed\n",
> ++                              attname, NULL, NULL);
> ++                goto next_attr;
> ++            } else {
> ++                uri =3D xmlParseURI((const char *) URL);
> ++                if (uri =3D=3D NULL) {
> ++                    xmlNsErr(ctxt, XML_WAR_NS_URI,
> ++                         "xmlns:%s: '%s' is not a valid URI\n",
> ++                                       attname, URL, NULL);
> ++                } else {
> ++                    if ((ctxt->pedantic) && (uri->scheme =3D=3D NULL)) =
{
> ++                        xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,
> ++                                  "xmlns:%s: URI %s is not absolute\n",
> ++                                  attname, URL, NULL);
> ++                    }
> ++                    xmlFreeURI(uri);
> ++                }
> ++            }
> +
> +-          /*
> +-           * Add the pair to atts
> +-           */
> +-          if ((atts =3D=3D NULL) || (nbatts + 5 > maxatts)) {
> +-              if (xmlCtxtGrowAttrs(ctxt, nbatts + 5) < 0) {
> +-                  if (attvalue[len] =3D=3D 0)
> +-                      xmlFree(attvalue);
> +-                  goto failed;
> +-              }
> +-              maxatts =3D ctxt->maxatts;
> +-              atts =3D ctxt->atts;
> +-          }
> +-          ctxt->attallocs[nratts++] =3D alloc;
> +-          atts[nbatts++] =3D attname;
> +-          atts[nbatts++] =3D aprefix;
> +-          atts[nbatts++] =3D NULL; /* the URI will be fetched later */
> +-          atts[nbatts++] =3D attvalue;
> +-          attvalue +=3D len;
> +-          atts[nbatts++] =3D attvalue;
> +-          /*
> +-           * tag if some deallocation is needed
> +-           */
> +-          if (alloc !=3D 0) attval =3D 1;
> +-      } else {
> +-          if ((attvalue !=3D NULL) && (attvalue[len] =3D=3D 0))
> +-              xmlFree(attvalue);
> +-      }
> ++            /*
> ++             * check that it's not a defined namespace
> ++             */
> ++            for (j =3D 1;j <=3D nbNs;j++)
> ++                if (ctxt->nsTab[ctxt->nsNr - 2 * j] =3D=3D attname)
> ++                    break;
> ++            if (j <=3D nbNs)
> ++                xmlErrAttributeDup(ctxt, aprefix, attname);
> ++            else
> ++                if (nsPush(ctxt, attname, URL) > 0) nbNs++;
> ++
> ++        } else {
> ++            /*
> ++             * Add the pair to atts
> ++             */
> ++            if ((atts =3D=3D NULL) || (nbatts + 5 > maxatts)) {
> ++                if (xmlCtxtGrowAttrs(ctxt, nbatts + 5) < 0) {
> ++                    goto next_attr;
> ++                }
> ++                maxatts =3D ctxt->maxatts;
> ++                atts =3D ctxt->atts;
> ++            }
> ++            ctxt->attallocs[nratts++] =3D alloc;
> ++            atts[nbatts++] =3D attname;
> ++            atts[nbatts++] =3D aprefix;
> ++            /*
> ++             * The namespace URI field is used temporarily to point at
> the
> ++             * base of the current input buffer for non-alloced
> attributes.
> ++             * When the input buffer is reallocated, all the pointers
> become
> ++             * invalid, but they can be reconstructed later.
> ++             */
> ++            if (alloc)
> ++                atts[nbatts++] =3D NULL;
> ++            else
> ++                atts[nbatts++] =3D ctxt->input->base;
> ++            atts[nbatts++] =3D attvalue;
> ++            attvalue +=3D len;
> ++            atts[nbatts++] =3D attvalue;
> ++            /*
> ++             * tag if some deallocation is needed
> ++             */
> ++            if (alloc !=3D 0) attval =3D 1;
> ++            attvalue =3D NULL; /* moved into atts */
> ++        }
> +
> +-failed:
> ++next_attr:
> ++        if ((attvalue !=3D NULL) && (alloc !=3D 0)) {
> ++            xmlFree(attvalue);
> ++            attvalue =3D NULL;
> ++        }
> +
> +       GROW
> +         if (ctxt->instate =3D=3D XML_PARSER_EOF)
> +             break;
> +-      if ((ctxt->input->base !=3D base) || (inputNr !=3D ctxt->inputNr)=
)
> +-          goto base_changed;
> +       if ((RAW =3D=3D '>') || (((RAW =3D=3D '/') && (NXT(1) =3D=3D '>')=
)))
> +           break;
> +       if (!IS_BLANK_CH(RAW)) {
> +@@ -9646,8 +9610,20 @@ failed:
> +           break;
> +       }
> +         GROW;
> +-      if ((ctxt->input->base !=3D base) || (inputNr !=3D ctxt->inputNr)=
)
> +-          goto base_changed;
> ++    }
> ++
> ++    /* Reconstruct attribute value pointers. */
> ++    for (i =3D 0, j =3D 0; j < nratts; i +=3D 5, j++) {
> ++        if (atts[i+2] !=3D NULL) {
> ++            /*
> ++             * Arithmetic on dangling pointers is technically undefined
> ++             * behavior, but well...
> ++             */
> ++            ptrdiff_t offset =3D ctxt->input->base - atts[i+2];
> ++            atts[i+2]  =3D NULL;    /* Reset repurposed namespace URI *=
/
> ++            atts[i+3] +=3D offset;  /* value */
> ++            atts[i+4] +=3D offset;  /* valuend */
> ++        }
> +     }
> +
> +     /*
> +@@ -9804,34 +9780,6 @@ failed:
> +     }
> +
> +     return(localname);
> +-
> +-base_changed:
> +-    /*
> +-     * the attribute strings are valid iif the base didn't changed
> +-     */
> +-    if (attval !=3D 0) {
> +-      for (i =3D 3,j =3D 0; j < nratts;i +=3D 5,j++)
> +-          if ((ctxt->attallocs[j] !=3D 0) && (atts[i] !=3D NULL))
> +-              xmlFree((xmlChar *) atts[i]);
> +-    }
> +-
> +-    /*
> +-     * We can't switch from one entity to another in the middle
> +-     * of a start tag
> +-     */
> +-    if (inputNr !=3D ctxt->inputNr) {
> +-        xmlFatalErrMsg(ctxt, XML_ERR_ENTITY_BOUNDARY,
> +-                  "Start tag doesn't start and stop in the same
> entity\n");
> +-      return(NULL);
> +-    }
> +-
> +-    ctxt->input->cur =3D ctxt->input->base + cur;
> +-    ctxt->input->line =3D oldline;
> +-    ctxt->input->col =3D oldcol;
> +-    if (ctxt->wellFormed =3D=3D 1) {
> +-      goto reparse;
> +-    }
> +-    return(NULL);
> + }
> +
> + /**
> +diff --git a/result/errors/759398.xml.err b/result/errors/759398.xml.err
> +index e08d9bf..f6036a3 100644
> +--- a/result/errors/759398.xml.err
> ++++ b/result/errors/759398.xml.err
> +@@ -1,9 +1,12 @@
> + ./test/errors/759398.xml:210: parser error : StartTag: invalid element
> name
> + need to worry about parsers whi<! don't expand PErefs finding
> +                                 ^
> +-./test/errors/759398.xml:309: parser error : Opening and ending tag
> mismatch: spec line 50 and termdef
> ++./test/errors/759398.xml:309: parser error : Opening and ending tag
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
> + and provide access to their content and structure.</termdef> <termdef
> +                                                             ^
> +-./test/errors/759398.xml:309: parser error : Extra content at the end
> of the document
> +-and provide access to their content and structure.</termdef> <termdef
> +-                                                             ^
> ++./test/errors/759398.xml:314: parser error : Opening and ending tag
> mismatch: spec line 50 and p
> ++data and the information it must provide to the application.</p>
> ++                                                                ^
> ++./test/errors/759398.xml:316: parser error : Extra content at the end
> of the document
> ++<div2 id=3D'sec-origin-goals'>
> ++^
> +diff --git a/result/errors/attr1.xml.err b/result/errors/attr1.xml.err
> +index 4f08538..c4c4fc8 100644
> +--- a/result/errors/attr1.xml.err
> ++++ b/result/errors/attr1.xml.err
> +@@ -1,6 +1,9 @@
> + ./test/errors/attr1.xml:2: parser error : AttValue: ' expected
> +
> + ^
> +-./test/errors/attr1.xml:1: parser error : Extra content at the end of
> the document
> +-<foo foo=3D"ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=
o
> oooooooooo
> +- ^
> ++./test/errors/attr1.xml:2: parser error : attributes construct error
> ++
> ++^
> ++./test/errors/attr1.xml:2: parser error : Couldn't find end of Start Ta=
g
> foo line 1
> ++
> ++^
> +diff --git a/result/errors/attr2.xml.err b/result/errors/attr2.xml.err
> +index c8a9c7d..77e342e 100644
> +--- a/result/errors/attr2.xml.err
> ++++ b/result/errors/attr2.xml.err
> +@@ -1,6 +1,9 @@
> + ./test/errors/attr2.xml:2: parser error : AttValue: ' expected
> +
> + ^
> +-./test/errors/attr2.xml:1: parser error : Extra content at the end of
> the document
> +-<foo foo=3D">oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=
oo
> ooooooooo
> +- ^
> ++./test/errors/attr2.xml:2: parser error : attributes construct error
> ++
> ++^
> ++./test/errors/attr2.xml:2: parser error : Couldn't find end of Start Ta=
g
> foo line 1
> ++
> ++^
> +diff --git a/result/errors/name2.xml.err b/result/errors/name2.xml.err
> +index a6649a1..8a6acee 100644
> +--- a/result/errors/name2.xml.err
> ++++ b/result/errors/name2.xml.err
> +@@ -1,6 +1,9 @@
> + ./test/errors/name2.xml:2: parser error : Specification mandate value
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
> +
> + ^
> +-./test/errors/name2.xml:1: parser error : Extra content at the end of
> the document
> +-<foo fooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
> ooooooooooooooo
> +- ^
> ++./test/errors/name2.xml:2: parser error : attributes construct error
> ++
> ++^
> ++./test/errors/name2.xml:2: parser error : Couldn't find end of Start Ta=
g
> foo line 1
> ++
> ++^
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb
> b/meta/recipes-core/libxml/libxml2_2.9.4.bb
> index 4f60781..0577ad6 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
> @@ -23,6 +23,7 @@ SRC_URI =3D "ftp://xmlsoft.org/libxml2/
> libxml2-${PV}.tar.gz;name=3Dlibtar \
>             file://libxml2-CVE-2016-5131.patch \
>             file://libxml2-CVE-2016-4658.patch \
>             file://libxml2-fix_NULL_pointer_derefs.patch \
> +           file://libxml2-fix_and_simplify_xmlParseStartTag2.patch \
>             file://CVE-2016-9318.patch \
>             file://0001-Make-ptest-run-the-python-tests-if-python-is-enab=
led.patch
> \
>             "
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

--001a1147e5f85436e40551fea0d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+VGhpcyBwYXRjaCB3b24mIzM5O3QgYXBwbHksIHByb2JhYmx5IGJlY2F1
c2Ugb2YgdGhlIGNyYXp5IGVuY29kaW5ncy7CoCBDYW4geW91IHB1c2ggdGhlIHNlcmllcyB0byBh
IGJyYW5jaD88ZGl2Pjxicj48L2Rpdj48ZGl2PlJvc3M8L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJn
bWFpbF9leHRyYSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiAxNSBKdW5lIDIwMTcg
YXQgMTM6MDgsIEFuZHJlaiBWYWxlayA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0
bzphbmRyZWoudmFsZWtAc2llbWVucy5jb20iIHRhcmdldD0iX2JsYW5rIj5hbmRyZWoudmFsZWtA
c2llbWVucy5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2Nj
IHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxzcGFuIGNsYXNzPSIiPlNpZ25lZC1vZmYtYnk6IEFu
ZHJlaiBWYWxlayAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFuZHJlai52YWxla0BzaWVtZW5zLmNvbSI+
YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPC9hPiZndDs8YnI+DQotLS08YnI+DQrCoC4uLmlieG1s
Mi1maXhfYW5kX3NpbXBsaWZ5Xzx3YnI+eG1sUGFyc2VTdGFydFRhZzIucGF0Y2ggfCA1OTAgKysr
KysrKysrKysrKysrKysrKysrPGJyPg0KwqBtZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvPGEgaHJl
Zj0iaHR0cDovL2xpYnhtbDJfMi45LjQuYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmxpYnhtPHdicj5sMl8yLjkuNC5iYjwvYT7CoCDCoCDCoCDCoCDCoCB8wqAgwqAxICs8YnI+
DQrCoDIgZmlsZXMgY2hhbmdlZCwgNTkxIGluc2VydGlvbnMoKyk8YnI+DQrCoGNyZWF0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvPHdicj5saWJ4bWwyL2xpYnhtbDItZml4
X2FuZF88d2JyPnNpbXBsaWZ5X3htbFBhcnNlU3RhcnRUYWcyLjx3YnI+cGF0Y2g8YnI+DQo8YnI+
DQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sLzx3YnI+bGlieG1sMi9saWJ4
bWwyLWZpeF9hbmRfPHdicj5zaW1wbGlmeV94bWxQYXJzZVN0YXJ0VGFnMi48d2JyPnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sLzx3YnI+bGlieG1sMi9saWJ4bWwyLWZpeF9hbmRfPHdi
cj5zaW1wbGlmeV94bWxQYXJzZVN0YXJ0VGFnMi48d2JyPnBhdGNoPGJyPg0KbmV3IGZpbGUgbW9k
ZSAxMDA2NDQ8YnI+DQo8L3NwYW4+aW5kZXggMDAwMDAwMC4uZmFhNTc3MDxicj4NCjxkaXYgY2xh
c3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPi0tLSAvZGV2L251bGw8YnI+DQorKysgYi9tZXRh
L3JlY2lwZXMtY29yZS9saWJ4bWwvPHdicj5saWJ4bWwyL2xpYnhtbDItZml4X2FuZF88d2JyPnNp
bXBsaWZ5X3htbFBhcnNlU3RhcnRUYWcyLjx3YnI+cGF0Y2g8YnI+DQpAQCAtMCwwICsxLDU5MCBA
QDxicj4NCitsaWJ4bWwyLTIuOS40OiBBdm9pZCByZXBhcnNpbmcgYW5kIHNpbXBsaWZ5IGNvbnRy
b2wgZmxvdyBpbiB4bWxQYXJzZVN0YXJ0VGFnMjxicj4NCis8YnI+DQorW05vIHVwc3RyZWFtIHRy
YWNraW5nXTxicj4NCis8YnI+DQorcGFyc2VyOiBBdm9pZCByZXBhcnNpbmcgaW4geG1sUGFyc2VT
dGFydFRhZzI8YnI+DQorPGJyPg0KK1RoZSBjb2RlIGluIHhtbFBhcnNlU3RhcnRUYWcyIG11c3Qg
aGFuZGxlIHRoZSBjYXNlIHRoYXQgdGhlIGlucHV0PGJyPg0KK2J1ZmZlciB3YXMgZ3Jvd24gYW5k
IHJlYWxsb2NhdGVkIHdoaWNoIGNhbiBpbnZhbGlkYXRlIHBvaW50ZXJzIHRvPGJyPg0KK2F0dHJp
YnV0ZSB2YWx1ZXMuIEJlZm9yZSwgdGhpcyB3YXMgaGFuZGxlZCBieSBkZXRlY3RpbmcgY2hhbmdl
cyBvZjxicj4NCit0aGUgaW5wdXQgYnVmZmVyICZxdW90O2Jhc2UmcXVvdDsgcG9pbnRlciBhbmQs
IGluIGNhc2Ugb2YgYSBjaGFuZ2UsIGp1bXBpbmc8YnI+DQorYmFjayB0byB0aGUgYmVnaW5uaW5n
IG9mIHRoZSBmdW5jdGlvbiBhbmQgcmVwYXJzaW5nIHRoZSBzdGFydCB0YWcuPGJyPg0KKzxicj4N
CitUaGUgbWFqb3IgcHJvYmxlbSBvZiB0aGlzIGFwcHJvYWNoIGlzIHRoYXQgd2hldGhlciBhbiBp
bnB1dCBidWZmZXIgaXM8YnI+DQorcmVhbGxvY2F0ZWQgaXMgbm9uZGV0ZXJtaW5pc3RpYywgcmVz
dWx0aW5nIGluIHNlZW1pbmdseSByYW5kb20gdGVzdDxicj4NCitmYWlsdXJlcy4gU2VlIHRoZSBt
YWlsaW5nIGxpc3QgdGhyZWFkICZxdW90O3J1bnRlc3QgbXlzdGVyeSBidWc6IG5hbWUyLnhtbDxi
cj4NCitlcnJvciBjYXNlIHJlZ3Jlc3Npb24gdGVzdCZxdW90OyBmcm9tIDIwMTIsIGZvciBleGFt
cGxlLjxicj4NCis8YnI+DQorSWYgYSByZWFsbG9jYXRpb24gd2FzIGRldGVjdGVkLCB0aGUgY29k
ZSBhbHNvIG1hZGUgbm8gYXR0ZW1wdHMgdG88YnI+DQorY29udGludWUgcGFyc2luZyBpbiBjYXNl
IG9mIGVycm9ycyB3aGljaCBtYWtlcyBhIGRpZmZlcmVuY2UgaW48YnI+DQordGhlIGxheCAmcXVv
dDtyZWNvdmVyJnF1b3Q7IG1vZGUuPGJyPg0KKzxicj4NCitOb3cgd2Ugc3RvcmUgdGhlIGN1cnJl
bnQgaW5wdXQgYnVmZmVyICZxdW90O2Jhc2UmcXVvdDsgcG9pbnRlciBmb3IgZWFjaCAobm90PGJy
Pg0KK3NlcGFyYXRlbHkgYWxsb2NhdGVkKSBhdHRyaWJ1dGUgaW4gdGhlIG5hbWVzcGFjZSBVUkkg
ZmllbGQsIHdoaWNoIGlzbiYjMzk7dDxicj4NCit1c2VkIHVudGlsIGxhdGVyLiBBZnRlciB0aGUg
d2hvbGUgc3RhcnQgdGFnIHdhcyBwYXJzZWQsIHRoZSBwb2ludGVycyB0bzxicj4NCit0aGUgYXR0
cmlidXRlIHZhbHVlcyBhcmUgcmVjb25zdHJ1Y3RlZCB1c2luZyB0aGUgb2Zmc2V0IGJldHdlZW4g
dGhlPGJyPg0KK25ldyBhbmQgdGhlIG9sZCBpbnB1dCBidWZmZXIuIFRoaXMgcmVsaWVzIG9uIGFy
aXRobWV0aWMgb24gZGFuZ2xpbmc8YnI+DQorcG9pbnRlcnMgd2hpY2ggaXMgdGVjaG5pY2FsbHkg
dW5kZWZpbmVkIGJlaGF2aW9yLiBCdXQgaXQgc2VlbXMgbGlrZTxicj4NCit0aGUgZWFzaWVzdCBh
bmQgbW9zdCBlZmZpY2llbnQgZml4IGFuZCBhIHNpbWlsYXIgYXBwcm9hY2ggaXMgdXNlZCBpbjxi
cj4NCit4bWxQYXJzZXJJbnB1dEdyb3cuPGJyPg0KKzxicj4NCitUaGlzIGNoYW5nZXMgdGhlIGVy
cm9yIG91dHB1dCBvZiBzZXZlcmFsIHRlc3RzLCB0eXBpY2FsbHkgbWFraW5nIGl0PGJyPg0KK21v
cmUgdmVyYm9zZSBiZWNhdXNlIHdlIHRyeSBoYXJkZXIgdG8gY29udGludWUgcGFyc2luZyBpbiBj
YXNlIG9mIGVycm9ycy48YnI+DQorPGJyPg0KKyhBbm90aGVyIHBvc3NpYmxlIHNvbHV0aW9uIGlz
IHRvIGNoZWNrIG5vdCBvbmx5IHRoZSAmcXVvdDtiYXNlJnF1b3Q7IHBvaW50ZXI8YnI+DQorYnV0
IHRoZSBzaXplIG9mIHRoZSBpbnB1dCBidWZmZXIgYXMgd2VsbC4gQnV0IHRoaXMgd291bGQgcmVz
dWx0IGluPGJyPg0KK2V2ZW4gbW9yZSByZXBhcnNpbmcuKTxicj4NCis8YnI+DQorUmVtb3ZlIHNv
bWUgZ290byBsYWJlbHMgYW5kIGRlZHVwbGljYXRlIGEgYml0IG9mIGNvZGUgYWZ0ZXIgaGFuZGxp
bmc8YnI+DQorbmFtZXNwYWNlcy48YnI+DQorPGJyPg0KK1RoZXJlIHdlcmUgdHdvIGJ1Z3Mgd2hl
cmUgcGFyYW1ldGVyLWVudGl0eSByZWZlcmVuY2VzIGNvdWxkIGxlYWQgdG8gYW48YnI+DQordW5l
eHBlY3RlZCBjaGFuZ2Ugb2YgdGhlIGlucHV0IGJ1ZmZlciBpbiB4bWxQYXJzZU5hbWVDb21wbGV4
IGFuZDxicj4NCit4bWxEaWN0TG9va3VwIGJlaW5nIGNhbGxlZCB3aXRoIGFuIGludmFsaWQgcG9p
bnRlci48YnI+DQorPGJyPg0KKzxicj4NCitVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0PGJyPg0K
PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iSE9FblpiIj48ZGl2IGNsYXNzPSJoNSI+KyAtIFs8YSBo
cmVmPSJodHRwczovL2dpdC5nbm9tZS5vcmcvYnJvd3NlL2xpYnhtbDIvY29tbWl0Lz9pZD0wN2I3
NDI4YjY5YzM2ODYxMWQyMTVhMTQwZmU2MzBiMmQxZTYxMzQ5IiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwczovL2dpdC5nbm9tZS5vcmcvYnJvd3NlLzx3YnI+bGlieG1sMi9j
b21taXQvP2lkPTx3YnI+MDdiNzQyOGI2OWMzNjg2MTFkMjE1YTE0MGZlNjMwPHdicj5iMmQxZTYx
MzQ5PC9hPl08YnI+DQorIC0gWzxhIGhyZWY9Imh0dHBzOi8vZ2l0Lmdub21lLm9yZy9icm93c2Uv
bGlieG1sMi9jb21taXQvP2lkPTg1NWMxOWVmYjdjZDMwZDkyN2Q2NzNiMzY1ODU2M2M0OTU5Y2E2
ZjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0Lmdub21lLm9y
Zy9icm93c2UvPHdicj5saWJ4bWwyL2NvbW1pdC8/aWQ9PHdicj44NTVjMTllZmI3Y2QzMGQ5Mjdk
NjczYjM2NTg1NjM8d2JyPmM0OTU5Y2E2ZjA8L2E+XTxicj4NCitTaWduZWQtb2ZmLWJ5OiBBbmRy
ZWogVmFsZWsgJmx0OzxhIGhyZWY9Im1haWx0bzphbmRyZWoudmFsZWtAc2llbWVucy5jb20iPmFu
ZHJlai52YWxla0BzaWVtZW5zLmNvbTwvYT4mZ3Q7PGJyPg0KKzxicj4NCitkaWZmIC0tZ2l0IGEv
cGFyc2VyLmMgYi9wYXJzZXIuYzxicj4NCitpbmRleCA2MDlhMjcwLi43NDAxNmUzIDEwMDY0NDxi
cj4NCistLS0gYS9wYXJzZXIuYzxicj4NCisrKysgYi9wYXJzZXIuYzxicj4NCitAQCAtNDMsNiAr
NDMsNyBAQDxicj4NCisgI2luY2x1ZGUgJmx0O2xpbWl0cy5oJmd0Ozxicj4NCisgI2luY2x1ZGUg
Jmx0O3N0cmluZy5oJmd0Ozxicj4NCisgI2luY2x1ZGUgJmx0O3N0ZGFyZy5oJmd0Ozxicj4NCisr
I2luY2x1ZGUgJmx0O3N0ZGRlZi5oJmd0Ozxicj4NCisgI2luY2x1ZGUgJmx0O2xpYnhtbC94bWxt
ZW1vcnkuaCZndDs8YnI+DQorICNpbmNsdWRlICZsdDtsaWJ4bWwvdGhyZWFkcy5oJmd0Ozxicj4N
CisgI2luY2x1ZGUgJmx0O2xpYnhtbC9nbG9iYWxzLmgmZ3Q7PGJyPg0KK0BAIC05Mzc3LDggKzkz
NzgsNyBAQCB4bWxQYXJzZVN0YXJ0VGFnMig8d2JyPnhtbFBhcnNlckN0eHRQdHIgY3R4dCwgY29u
c3QgeG1sQ2hhciAqKnByZWYsPGJyPg0KK8KgIMKgIMKgY29uc3QgeG1sQ2hhciAqKmF0dHMgPSBj
dHh0LSZndDthdHRzOzxicj4NCivCoCDCoCDCoGludCBtYXhhdHRzID0gY3R4dC0mZ3Q7bWF4YXR0
czs8YnI+DQorwqAgwqAgwqBpbnQgbnJhdHRzLCBuYmF0dHMsIG5iZGVmOzxicj4NCistwqAgwqAg
aW50IGksIGosIG5iTnMsIGF0dHZhbCwgb2xkbGluZSwgb2xkY29sLCBpbnB1dE5yOzxicj4NCist
wqAgwqAgY29uc3QgeG1sQ2hhciAqYmFzZTs8YnI+DQorK8KgIMKgIGludCBpLCBqLCBuYk5zLCBh
dHR2YWw7PGJyPg0KK8KgIMKgIMKgdW5zaWduZWQgbG9uZyBjdXI7PGJyPg0KK8KgIMKgIMKgaW50
IG5zTnIgPSBjdHh0LSZndDtuc05yOzxicj4NCis8YnI+DQorQEAgLTkzOTIsMTMgKzkzOTIsOCBA
QCB4bWxQYXJzZVN0YXJ0VGFnMig8d2JyPnhtbFBhcnNlckN0eHRQdHIgY3R4dCwgY29uc3QgeG1s
Q2hhciAqKnByZWYsPGJyPg0KK8KgIMKgIMKgICrCoCDCoCDCoCDCoFRoZSBTaHJpbmtpbmcgaXMg
b25seSBwb3NzaWJsZSBvbmNlIHRoZSBmdWxsIHNldCBvZiBhdHRyaWJ1dGU8YnI+DQorwqAgwqAg
wqAgKsKgIMKgIMKgIMKgY2FsbGJhY2tzIGhhdmUgYmVlbiBkb25lLjxicj4NCivCoCDCoCDCoCAq
Lzxicj4NCistcmVwYXJzZTo8YnI+DQorwqAgwqAgwqBTSFJJTks7PGJyPg0KKy3CoCDCoCBiYXNl
ID0gY3R4dC0mZ3Q7aW5wdXQtJmd0O2Jhc2U7PGJyPg0KK8KgIMKgIMKgY3VyID0gY3R4dC0mZ3Q7
aW5wdXQtJmd0O2N1ciAtIGN0eHQtJmd0O2lucHV0LSZndDtiYXNlOzxicj4NCistwqAgwqAgaW5w
dXROciA9IGN0eHQtJmd0O2lucHV0TnI7PGJyPg0KKy3CoCDCoCBvbGRsaW5lID0gY3R4dC0mZ3Q7
aW5wdXQtJmd0O2xpbmU7PGJyPg0KKy3CoCDCoCBvbGRjb2wgPSBjdHh0LSZndDtpbnB1dC0mZ3Q7
Y29sOzxicj4NCivCoCDCoCDCoG5iYXR0cyA9IDA7PGJyPg0KK8KgIMKgIMKgbnJhdHRzID0gMDs8
YnI+DQorwqAgwqAgwqBuYmRlZiA9IDA7PGJyPg0KK0BAIC05NDIyLDggKzk0MTcsNiBAQCByZXBh
cnNlOjxicj4NCivCoCDCoCDCoCAqLzxicj4NCivCoCDCoCDCoFNLSVBfQkxBTktTOzxicj4NCivC
oCDCoCDCoEdST1c7PGJyPg0KKy3CoCDCoCBpZiAoKGN0eHQtJmd0O2lucHV0LSZndDtiYXNlICE9
IGJhc2UpIHx8IChpbnB1dE5yICE9IGN0eHQtJmd0O2lucHV0TnIpKTxicj4NCistwqAgwqAgwqAg
wqAgZ290byBiYXNlX2NoYW5nZWQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoHdoaWxlICgoKFJBVyAh
PSAmIzM5OyZndDsmIzM5OykgJmFtcDsmYW1wOzxicj4NCivCoCDCoCDCoCDCoCDCoCAoKFJBVyAh
PSAmIzM5Oy8mIzM5OykgfHwgKE5YVCgxKSAhPSAmIzM5OyZndDsmIzM5OykpICZhbXA7JmFtcDs8
YnI+DQorQEAgLTk0MzQsMjAzICs5NDI3LDE3NCBAQCByZXBhcnNlOjxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqBhdHRuYW1lID0geG1sUGFyc2VBdHRyaWJ1dGUyKGN0eHQsIHByZWZpeCwgbG9jYWxu
YW1lLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmYW1wO2FwcmVmaXgsICZhbXA7YXR0dmFsdWUsICZhbXA7bGVuLCAmYW1wO2FsbG9j
KTs8YnI+DQorLcKgIMKgIMKgIGlmICgoY3R4dC0mZ3Q7aW5wdXQtJmd0O2Jhc2UgIT0gYmFzZSkg
fHwgKGlucHV0TnIgIT0gY3R4dC0mZ3Q7aW5wdXROcikpIHs8YnI+DQorLcKgIMKgIMKgIMKgIMKg
IGlmICgoYXR0dmFsdWUgIT0gTlVMTCkgJmFtcDsmYW1wOyAoYWxsb2MgIT0gMCkpPGJyPg0KKy3C
oCDCoCDCoCDCoCDCoCDCoCDCoCB4bWxGcmVlKGF0dHZhbHVlKTs8YnI+DQorLcKgIMKgIMKgIMKg
IMKgIGF0dHZhbHVlID0gTlVMTDs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIGdvdG8gYmFzZV9jaGFu
Z2VkOzxicj4NCistwqAgwqAgwqAgfTxicj4NCistwqAgwqAgwqAgwqAgaWYgKChhdHRuYW1lICE9
IE5VTEwpICZhbXA7JmFtcDsgKGF0dHZhbHVlICE9IE5VTEwpKSB7PGJyPg0KKy3CoCDCoCDCoCDC
oCDCoCBpZiAobGVuICZsdDsgMCkgbGVuID0geG1sU3RybGVuKGF0dHZhbHVlKTs8YnI+DQorLcKg
IMKgIMKgIMKgIMKgIMKgIGlmICgoYXR0bmFtZSA9PSBjdHh0LSZndDtzdHJfeG1sbnMpICZhbXA7
JmFtcDsgKGFwcmVmaXggPT0gTlVMTCkpIHs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIGNv
bnN0IHhtbENoYXIgKlVSTCA9IHhtbERpY3RMb29rdXAoY3R4dC0mZ3Q7ZGljdCwgYXR0dmFsdWUs
IGxlbik7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCB4bWxVUklQdHIgdXJpOzxicj4NCist
PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoVVJMID09IE5VTEwpIHs8YnI+DQor
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHhtbEVyck1lbW9yeShjdHh0LCAmcXVvdDtkaWN0
aW9uYXJ5IGFsbG9jYXRpb24gZmFpbHVyZSZxdW90Oyk7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBpZiAoKGF0dHZhbHVlICE9IE5VTEwpICZhbXA7JmFtcDsgKGFsbG9jICE9IDAp
KTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgeG1sRnJlZShhdHR2YWx1
ZSk7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4oTlVMTCk7PGJyPg0K
Ky3CoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBp
ZiAoKlVSTCAhPSAwKSB7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1cmkgPSB4
bWxQYXJzZVVSSSgoY29uc3QgY2hhciAqKSBVUkwpOzxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaWYgKHVyaSA9PSBOVUxMKSB7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB4bWxOc0VycihjdHh0LCBYTUxfV0FSX05TX1VSSSw8YnI+DQorLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7eG1sbnM6ICYjMzk7
JXMmIzM5OyBpcyBub3QgYSB2YWxpZCBVUklcbiZxdW90Oyw8YnI+DQorLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVVJMLCBOVUxM
LCBOVUxMKTs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0K
Ky3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAodXJpLSZndDtzY2hlbWUgPT0g
TlVMTCkgezxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgeG1s
TnNXYXJuKGN0eHQsIFhNTF9XQVJfTlNfVVJJX1JFTEFUSVZFLDxicj4NCistwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7eG1sbnM6IFVS
SSAlcyBpcyBub3QgYWJzb2x1dGVcbiZxdW90Oyw8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFVSTCwgTlVMTCwgTlVMTCk7PGJyPg0K
Ky3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKy3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB4bWxGcmVlVVJJKHVyaSk7PGJyPg0KKy3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB9PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoVVJM
ID09IGN0eHQtJmd0O3N0cl94bWxfbnMpIHs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGlmIChhdHRuYW1lICE9IGN0eHQtJmd0O3N0cl94bWwpIHs8YnI+DQorLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHhtbE5zRXJyKGN0eHQsIFhNTF9OU19F
UlJfWE1MX05BTUVTUEFDRSw8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJnF1b3Q7eG1sIG5hbWVzcGFjZSBVUkkgY2Fubm90IGJlIHRoZSBkZWZhdWx0IG5hbWVzcGFj
ZVxuJnF1b3Q7LDxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBOVUxMLCBOVUxMLCBOVUxMKTs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIH08YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGdvdG8gc2tpcF9kZWZhdWx0X25zOzxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKChsZW4gPT0gMjkpICZhbXA7
JmFtcDs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICh4bWxTdHJFcXVh
bChVUkwsPGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoEJBRF9DQVNUICZxdW90OzxhIGhyZWY9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAveG1sbnMv
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vd3d3LnczLm9yZy8yMDAw
L3htbG5zLzwvYT48d2JyPiZxdW90OykpKSB7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB4bWxOc0VycihjdHh0LCBYTUxfTlNfRVJSX1hNTF9OQU1FU1BBQ0UsPGJyPg0K
Ky3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O3JldXNlIG9m
IHRoZSB4bWxucyBuYW1lc3BhY2UgbmFtZSBpcyBmb3JiaWRkZW5cbiZxdW90Oyw8YnI+DQorLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTlVMTCwgTlVMTCwg
TlVMTCk7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIHNraXBf
ZGVmYXVsdF9uczs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQorLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qPGJyPg0K
Ky3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCogY2hlY2sgdGhhdCBpdCYjMzk7cyBub3QgYSBkZWZp
bmVkIG5hbWVzcGFjZTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCistwqAg
wqAgwqAgwqAgwqAgwqAgwqAgZm9yIChqID0gMTtqICZsdDs9IG5iTnM7aisrKTxicj4NCistwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGN0eHQtJmd0O25zVGFiW2N0eHQtJmd0O25zTnIg
LSAyICogal0gPT0gTlVMTCk8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGJyZWFrOzxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGogJmx0Oz0gbmJOcyk8YnI+
DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHhtbEVyckF0dHJpYnV0ZUR1cChjdHh0LCBO
VUxMLCBhdHRuYW1lKTs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIGVsc2U8YnI+DQorLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChuc1B1c2goY3R4dCwgTlVMTCwgVVJMKSAmZ3Q7
IDApIG5iTnMrKzs8YnI+DQorLXNraXBfZGVmYXVsdF9uczo8YnI+DQorLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIGlmICgoYXR0dmFsdWUgIT0gTlVMTCkgJmFtcDsmYW1wOyAoYWxsb2MgIT0gMCkpIHs8
YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHhtbEZyZWUoYXR0dmFsdWUpOzxicj4N
CistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXR0dmFsdWUgPSBOVUxMOzxicj4NCistwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKChSQVcg
PT0gJiMzOTsmZ3Q7JiMzOTspIHx8ICgoKFJBVyA9PSAmIzM5Oy8mIzM5OykgJmFtcDsmYW1wOyAo
TlhUKDEpID09ICYjMzk7Jmd0OyYjMzk7KSkpKTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgYnJlYWs7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoIUlTX0JMQU5LX0NI
KFJBVykpIHs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHhtbEZhdGFsRXJyTXNn
KGN0eHQsIFhNTF9FUlJfU1BBQ0VfUkVRVUlSRUQsPGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O2F0dHJpYnV0ZXMgY29uc3RydWN0
IGVycm9yXG4mcXVvdDspOzxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7
PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDC
oCBTS0lQX0JMQU5LUzs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICgoY3R4dC0mZ3Q7
aW5wdXQtJmd0O2Jhc2UgIT0gYmFzZSkgfHwgKGlucHV0TnIgIT0gY3R4dC0mZ3Q7aW5wdXROcikp
PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIGJhc2VfY2hhbmdlZDs8YnI+
DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbnRpbnVlOzxicj4NCistwqAgwqAgwqAgwqAgwqAg
fTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGFwcmVmaXggPT0gY3R4dC0mZ3Q7c3RyX3ht
bG5zKSB7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCBjb25zdCB4bWxDaGFyICpVUkwgPSB4
bWxEaWN0TG9va3VwKGN0eHQtJmd0O2RpY3QsIGF0dHZhbHVlLCBsZW4pOzxicj4NCistwqAgwqAg
wqAgwqAgwqAgwqAgwqAgeG1sVVJJUHRyIHVyaTs8YnI+DQorLTxicj4NCistwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgaWYgKGF0dG5hbWUgPT0gY3R4dC0mZ3Q7c3RyX3htbCkgezxicj4NCistwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKFVSTCAhPSBjdHh0LSZndDtzdHJfeG1sX25zKSB7
PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB4bWxOc0VycihjdHh0LCBY
TUxfTlNfRVJSX1hNTF9OQU1FU1BBQ0UsPGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O3htbCBuYW1lc3BhY2UgcHJlZml4IG1hcHBlZCB0
byB3cm9uZyBVUklcbiZxdW90Oyw8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgTlVMTCwgTlVMTCwgTlVMTCk7PGJyPg0KKy3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB9PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKjxicj4N
CistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIERvIG5vdCBrZWVwIGEgbmFtZXNwYWNl
IGRlZmluaXRpb24gbm9kZTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxi
cj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ290byBza2lwX25zOzxicj4NCistwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCisrwqAgwqAgwqAgwqAgaWYgKChhdHRuYW1lID09IE5V
TEwpIHx8IChhdHR2YWx1ZSA9PSBOVUxMKSk8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIGdvdG8g
bmV4dF9hdHRyOzxicj4NCisrwqAgwqAgwqAgaWYgKGxlbiAmbHQ7IDApIGxlbiA9IHhtbFN0cmxl
bihhdHR2YWx1ZSk7PGJyPg0KKys8YnI+DQorK8KgIMKgIMKgIMKgIGlmICgoYXR0bmFtZSA9PSBj
dHh0LSZndDtzdHJfeG1sbnMpICZhbXA7JmFtcDsgKGFwcmVmaXggPT0gTlVMTCkpIHs8YnI+DQor
K8KgIMKgIMKgIMKgIMKgIMKgIGNvbnN0IHhtbENoYXIgKlVSTCA9IHhtbERpY3RMb29rdXAoY3R4
dC0mZ3Q7ZGljdCwgYXR0dmFsdWUsIGxlbik7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCB4bWxV
UklQdHIgdXJpOzxicj4NCisrPGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBpZiAoVVJMID09IE5V
TEwpIHs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHhtbEVyck1lbW9yeShjdHh0LCAm
cXVvdDtkaWN0aW9uYXJ5IGFsbG9jYXRpb24gZmFpbHVyZSZxdW90Oyk7PGJyPg0KKyvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBpZiAoKGF0dHZhbHVlICE9IE5VTEwpICZhbXA7JmFtcDsgKGFsbG9j
ICE9IDApKTxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgeG1sRnJlZShhdHR2
YWx1ZSk7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4oTlVMTCk7PGJyPg0K
KyvCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBpZiAoKlVSTCAh
PSAwKSB7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1cmkgPSB4bWxQYXJzZVVSSSgo
Y29uc3QgY2hhciAqKSBVUkwpOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHVy
aSA9PSBOVUxMKSB7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB4bWxOc0Vy
cihjdHh0LCBYTUxfV0FSX05TX1VSSSw8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7eG1sbnM6ICYjMzk7JXMmIzM5OyBpcyBub3QgYSB2YWxp
ZCBVUklcbiZxdW90Oyw8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVVJMLCBOVUxMLCBOVUxMKTs8YnI+DQorK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBpZiAodXJpLSZndDtzY2hlbWUgPT0gTlVMTCkgezxicj4NCisrwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgeG1sTnNXYXJuKGN0eHQsIFhNTF9XQVJfTlNfVVJJX1JFTEFU
SVZFLDxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgJnF1b3Q7eG1sbnM6IFVSSSAlcyBpcyBub3QgYWJzb2x1dGVcbiZxdW90Oyw8YnI+DQor
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFVSTCwg
TlVMTCwgTlVMTCk7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0K
KyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB4bWxGcmVlVVJJKHVyaSk7PGJyPg0KKyvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aWYgKFVSTCA9PSBjdHh0LSZndDtzdHJfeG1sX25zKSB7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBpZiAoYXR0bmFtZSAhPSBjdHh0LSZndDtzdHJfeG1sKSB7PGJyPg0KKy3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB4bWxOc0VycihjdHh0LCBYTUxfTlNfRVJSX1hN
TF9OQU1FU1BBQ0UsPGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZxdW90O3htbCBuYW1lc3BhY2UgVVJJIG1hcHBlZCB0byB3cm9uZyBwcmVmaXhc
biZxdW90Oyw8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgTlVMTCwgTlVMTCwgTlVMTCk7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCB9PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIHNraXBfbnM7PGJyPg0K
Ky3CoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBp
ZiAoYXR0bmFtZSA9PSBjdHh0LSZndDtzdHJfeG1sbnMpIHs8YnI+DQorLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHhtbE5zRXJyKGN0eHQsIFhNTF9OU19FUlJfWE1MX05BTUVTUEFDRSw8YnI+
DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7cmVkZWZp
bml0aW9uIG9mIHRoZSB4bWxucyBwcmVmaXggaXMgZm9yYmlkZGVuXG4mcXVvdDssPGJyPg0KKy3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5VTEwsIE5VTEwsIE5VTEwp
Ozxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ290byBza2lwX25zOzxicj4NCist
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKChs
ZW4gPT0gMjkpICZhbXA7JmFtcDs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICh4
bWxTdHJFcXVhbChVUkwsPGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoEJBRF9DQVNUICZxdW90OzxhIGhyZWY9Imh0dHA6Ly93d3cudzMub3JnLzIw
MDAveG1sbnMvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vd3d3Lncz
Lm9yZy8yMDAwL3htbG5zLzwvYT48d2JyPiZxdW90OykpKSB7PGJyPg0KKy3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB4bWxOc0VycihjdHh0LCBYTUxfTlNfRVJSX1hNTF9OQU1FU1BBQ0UsPGJy
Pg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O3JldXNl
IG9mIHRoZSB4bWxucyBuYW1lc3BhY2UgbmFtZSBpcyBmb3JiaWRkZW5cbiZxdW90Oyw8YnI+DQor
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTlVMTCwgTlVMTCwgTlVM
TCk7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIHNraXBfbnM7PGJyPg0K
Ky3CoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAo
KFVSTCA9PSBOVUxMKSB8fCAoVVJMWzBdID09IDApKSB7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB4bWxOc0VycihjdHh0LCBYTUxfTlNfRVJSX1hNTF9OQU1FU1BBQ0UsPGJyPg0K
Ky3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O3htbG5zOiVz
OiBFbXB0eSBYTUwgbmFtZXNwYWNlIGlzIG5vdCBhbGxvd2VkXG4mcXVvdDssPGJyPg0KKy3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhdHRuYW1lLCBOVUxM
LCBOVUxMKTs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdvdG8gc2tpcF9uczs8
YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0KKy3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB1cmkgPSB4bWxQYXJzZVVSSSgoY29uc3QgY2hhciAqKSBVUkwpOzxicj4N
CistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHVyaSA9PSBOVUxMKSB7PGJyPg0KKy3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB4bWxOc0VycihjdHh0LCBYTUxfV0FSX05T
X1VSSSw8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1
b3Q7eG1sbnM6JXM6ICYjMzk7JXMmIzM5OyBpcyBub3QgYSB2YWxpZCBVUklcbiZxdW90Oyw8YnI+
DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgYXR0bmFtZSwgVVJMLCBOVUxMKTs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIH0gZWxzZSB7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBp
ZiAoKGN0eHQtJmd0O3BlZGFudGljKSAmYW1wOyZhbXA7ICh1cmktJmd0O3NjaGVtZSA9PSBOVUxM
KSkgezxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgeG1sTnNX
YXJuKGN0eHQsIFhNTF9XQVJfTlNfVVJJX1JFTEFUSVZFLDxicj4NCistwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7eG1sbnM6JXM6IFVS
SSAlcyBpcyBub3QgYWJzb2x1dGVcbiZxdW90Oyw8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGF0dG5hbWUsIFVSTCwgTlVMTCk7PGJy
Pg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKy3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB4bWxGcmVlVVJJKHVyaSk7PGJyPg0KKy3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKy08
YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qPGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCogY2hlY2sgdGhhdCBpdCYjMzk7cyBub3QgYSBkZWZpbmVkIG5hbWVzcGFjZTxicj4NCist
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgZm9y
IChqID0gMTtqICZsdDs9IG5iTnM7aisrKTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgaWYgKGN0eHQtJmd0O25zVGFiW2N0eHQtJmd0O25zTnIgLSAyICogal0gPT0gYXR0bmFtZSk8
YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCistwqAg
wqAgwqAgwqAgwqAgwqAgwqAgaWYgKGogJmx0Oz0gbmJOcyk8YnI+DQorLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHhtbEVyckF0dHJpYnV0ZUR1cChjdHh0LCBhcHJlZml4LCBhdHRuYW1lKTs8
YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIGVsc2U8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGlmIChuc1B1c2goY3R4dCwgYXR0bmFtZSwgVVJMKSAmZ3Q7IDApIG5iTnMrKzs8
YnI+DQorLXNraXBfbnM6PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoKGF0dHZhbHVl
ICE9IE5VTEwpICZhbXA7JmFtcDsgKGFsbG9jICE9IDApKSB7PGJyPg0KKy3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB4bWxGcmVlKGF0dHZhbHVlKTs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGF0dHZhbHVlID0gTlVMTDs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIH08
YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICgoUkFXID09ICYjMzk7Jmd0OyYjMzk7KSB8
fCAoKChSQVcgPT0gJiMzOTsvJiMzOTspICZhbXA7JmFtcDsgKE5YVCgxKSA9PSAmIzM5OyZndDsm
IzM5OykpKSk8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCist
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKCFJU19CTEFOS19DSChSQVcpKSB7PGJyPg0KKy3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB4bWxGYXRhbEVyck1zZyhjdHh0LCBYTUxfRVJSX1NQQUNF
X1JFUVVJUkVELDxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmcXVvdDthdHRyaWJ1dGVzIGNvbnN0cnVjdCBlcnJvclxuJnF1b3Q7KTs8YnI+
DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCistwqAgwqAgwqAgwqAg
wqAgwqAgwqAgfTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgU0tJUF9CTEFOS1M7PGJyPg0K
Ky3CoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoKGN0eHQtJmd0O2lucHV0LSZndDtiYXNlICE9IGJh
c2UpIHx8IChpbnB1dE5yICE9IGN0eHQtJmd0O2lucHV0TnIpKTxicj4NCistwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgZ290byBiYXNlX2NoYW5nZWQ7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDC
oCDCoCBjb250aW51ZTs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIH08YnI+DQorK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGlmIChhdHRuYW1lICE9IGN0eHQtJmd0O3N0cl94bWwpIHs8YnI+
DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHhtbE5zRXJyKGN0eHQsIFhN
TF9OU19FUlJfWE1MX05BTUVTUEFDRSw8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJnF1b3Q7eG1sIG5hbWVzcGFjZSBVUkkgY2Fubm90IGJlIHRoZSBkZWZhdWx0IG5hbWVz
cGFjZVxuJnF1b3Q7LDxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBOVUxMLCBOVUxMLCBOVUxMKTs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIH08YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdvdG8g
bmV4dF9hdHRyOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCisrwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgaWYgKChsZW4gPT0gMjkpICZhbXA7JmFtcDs8YnI+DQorK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICh4bWxTdHJFcXVhbChVUkwsPGJyPg0KKyvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEJBRF9DQVNUICZxdW90OzxhIGhy
ZWY9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAveG1sbnMvIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vd3d3LnczLm9yZy8yMDAwL3htbG5zLzwvYT48d2JyPiZxdW90Oykp
KSB7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB4bWxOc0VycihjdHh0LCBY
TUxfTlNfRVJSX1hNTF9OQU1FU1BBQ0UsPGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZxdW90O3JldXNlIG9mIHRoZSB4bWxucyBuYW1lc3BhY2UgbmFtZSBpcyBm
b3JiaWRkZW5cbiZxdW90Oyw8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgTlVMTCwgTlVMTCwgTlVMTCk7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBnb3RvIG5leHRfYXR0cjs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IH08YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIC8q
PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCogY2hlY2sgdGhhdCBpdCYjMzk7cyBub3QgYSBk
ZWZpbmVkIG5hbWVzcGFjZTxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCisrwqAg
wqAgwqAgwqAgwqAgwqAgZm9yIChqID0gMTtqICZsdDs9IG5iTnM7aisrKTxicj4NCisrwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgaWYgKGN0eHQtJmd0O25zVGFiW2N0eHQtJmd0O25zTnIgLSAyICog
al0gPT0gTlVMTCk8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxi
cj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGogJmx0Oz0gbmJOcyk8YnI+DQorK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHhtbEVyckF0dHJpYnV0ZUR1cChjdHh0LCBOVUxMLCBhdHRuYW1lKTs8
YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIGVsc2U8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGlmIChuc1B1c2goY3R4dCwgTlVMTCwgVVJMKSAmZ3Q7IDApIG5iTnMrKzs8YnI+DQorKzxi
cj4NCisrwqAgwqAgwqAgwqAgfSBlbHNlIGlmIChhcHJlZml4ID09IGN0eHQtJmd0O3N0cl94bWxu
cykgezxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgY29uc3QgeG1sQ2hhciAqVVJMID0geG1sRGlj
dExvb2t1cChjdHh0LSZndDtkaWN0LCBhdHR2YWx1ZSwgbGVuKTs8YnI+DQorK8KgIMKgIMKgIMKg
IMKgIMKgIHhtbFVSSVB0ciB1cmk7PGJyPg0KKys8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIGlm
IChhdHRuYW1lID09IGN0eHQtJmd0O3N0cl94bWwpIHs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGlmIChVUkwgIT0gY3R4dC0mZ3Q7c3RyX3htbF9ucykgezxicj4NCisrwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgeG1sTnNFcnIoY3R4dCwgWE1MX05TX0VSUl9YTUxfTkFNRVNQ
QUNFLDxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAm
cXVvdDt4bWwgbmFtZXNwYWNlIHByZWZpeCBtYXBwZWQgdG8gd3JvbmcgVVJJXG4mcXVvdDssPGJy
Pg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5VTEwsIE5V
TEwsIE5VTEwpOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCisrwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgLyo8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBE
byBub3Qga2VlcCBhIG5hbWVzcGFjZSBkZWZpbml0aW9uIG5vZGU8YnI+DQorK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgKi88YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdvdG8gbmV4
dF9hdHRyOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCisrwqAgwqAgwqAgwqAgwqAg
wqAgaWYgKFVSTCA9PSBjdHh0LSZndDtzdHJfeG1sX25zKSB7PGJyPg0KKyvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBpZiAoYXR0bmFtZSAhPSBjdHh0LSZndDtzdHJfeG1sKSB7PGJyPg0KKyvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB4bWxOc0VycihjdHh0LCBYTUxfTlNfRVJSX1hNTF9O
QU1FU1BBQ0UsPGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZxdW90O3htbCBuYW1lc3BhY2UgVVJJIG1hcHBlZCB0byB3cm9uZyBwcmVmaXhcbiZxdW90
Oyw8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTlVM
TCwgTlVMTCwgTlVMTCk7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKyvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIG5leHRfYXR0cjs8YnI+DQorK8KgIMKgIMKgIMKg
IMKgIMKgIH08YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIGlmIChhdHRuYW1lID09IGN0eHQtJmd0
O3N0cl94bWxucykgezxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgeG1sTnNFcnIoY3R4
dCwgWE1MX05TX0VSUl9YTUxfTkFNRVNQQUNFLDxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtyZWRlZmluaXRpb24gb2YgdGhlIHhtbG5zIHByZWZpeCBp
cyBmb3JiaWRkZW5cbiZxdW90Oyw8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgTlVMTCwgTlVMTCwgTlVMTCk7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBnb3RvIG5leHRfYXR0cjs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQorK8KgIMKg
IMKgIMKgIMKgIMKgIGlmICgobGVuID09IDI5KSAmYW1wOyZhbXA7PGJyPg0KKyvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAoeG1sU3RyRXF1YWwoVVJMLDxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBCQURfQ0FTVCAmcXVvdDs8YSBocmVmPSJodHRwOi8v
d3d3LnczLm9yZy8yMDAwL3htbG5zLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL3d3dy53My5vcmcvMjAwMC94bWxucy88L2E+PHdicj4mcXVvdDspKSkgezxicj4NCisr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgeG1sTnNFcnIoY3R4dCwgWE1MX05TX0VSUl9YTUxfTkFN
RVNQQUNFLDxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVv
dDtyZXVzZSBvZiB0aGUgeG1sbnMgbmFtZXNwYWNlIG5hbWUgaXMgZm9yYmlkZGVuXG4mcXVvdDss
PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5VTEwsIE5VTEws
IE5VTEwpOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ290byBuZXh0X2F0dHI7PGJy
Pg0KKyvCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBpZiAoKFVS
TCA9PSBOVUxMKSB8fCAoVVJMWzBdID09IDApKSB7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB4bWxOc0VycihjdHh0LCBYTUxfTlNfRVJSX1hNTF9OQU1FU1BBQ0UsPGJyPg0KKyvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O3htbG5zOiVzOiBFbXB0eSBY
TUwgbmFtZXNwYWNlIGlzIG5vdCBhbGxvd2VkXG4mcXVvdDssPGJyPg0KKyvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhdHRuYW1lLCBOVUxMLCBOVUxMKTs8YnI+
DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdvdG8gbmV4dF9hdHRyOzxicj4NCisrwqAgwqAg
wqAgwqAgwqAgwqAgfSBlbHNlIHs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVyaSA9
IHhtbFBhcnNlVVJJKChjb25zdCBjaGFyICopIFVSTCk7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBpZiAodXJpID09IE5VTEwpIHs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHhtbE5zRXJyKGN0eHQsIFhNTF9XQVJfTlNfVVJJLDxicj4NCisrwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDt4bWxuczolczogJiMzOTslcyYjMzk7IGlz
IG5vdCBhIHZhbGlkIFVSSVxuJnF1b3Q7LDxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdHRuYW1lLCBVUkwsIE5VTEwpOzxi
cj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSBlbHNlIHs8YnI+DQorK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGlmICgoY3R4dC0mZ3Q7cGVkYW50aWMpICZhbXA7JmFtcDsgKHVy
aS0mZ3Q7c2NoZW1lID09IE5VTEwpKSB7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB4bWxOc1dhcm4oY3R4dCwgWE1MX1dBUl9OU19VUklfUkVMQVRJVkUsPGJyPg0K
KyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVv
dDt4bWxuczolczogVVJJICVzIGlzIG5vdCBhYnNvbHV0ZVxuJnF1b3Q7LDxicj4NCisrwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXR0bmFtZSwgVVJM
LCBOVUxMKTs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQorK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHhtbEZyZWVVUkkodXJpKTs8YnI+DQorK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQorPGJy
Pg0KKy3CoCDCoCDCoCDCoCDCoCAvKjxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAqIEFkZCB0aGUg
cGFpciB0byBhdHRzPGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCovPGJyPg0KKy3CoCDCoCDCoCDC
oCDCoCBpZiAoKGF0dHMgPT0gTlVMTCkgfHwgKG5iYXR0cyArIDUgJmd0OyBtYXhhdHRzKSkgezxi
cj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHhtbEN0eHRHcm93QXR0cnMoY3R4dCwgbmJh
dHRzICsgNSkgJmx0OyAwKSB7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAo
YXR0dmFsdWVbbGVuXSA9PSAwKTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgeG1sRnJlZShhdHR2YWx1ZSk7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBn
b3RvIGZhaWxlZDs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQorLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIG1heGF0dHMgPSBjdHh0LSZndDttYXhhdHRzOzxicj4NCistwqAgwqAgwqAg
wqAgwqAgwqAgwqAgYXR0cyA9IGN0eHQtJmd0O2F0dHM7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCB9
PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCBjdHh0LSZndDthdHRhbGxvY3NbbnJhdHRzKytdID0gYWxs
b2M7PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCBhdHRzW25iYXR0cysrXSA9IGF0dG5hbWU7PGJyPg0K
Ky3CoCDCoCDCoCDCoCDCoCBhdHRzW25iYXR0cysrXSA9IGFwcmVmaXg7PGJyPg0KKy3CoCDCoCDC
oCDCoCDCoCBhdHRzW25iYXR0cysrXSA9IE5VTEw7IC8qIHRoZSBVUkkgd2lsbCBiZSBmZXRjaGVk
IGxhdGVyICovPGJyPg0KKy3CoCDCoCDCoCDCoCDCoCBhdHRzW25iYXR0cysrXSA9IGF0dHZhbHVl
Ozxicj4NCistwqAgwqAgwqAgwqAgwqAgYXR0dmFsdWUgKz0gbGVuOzxicj4NCistwqAgwqAgwqAg
wqAgwqAgYXR0c1tuYmF0dHMrK10gPSBhdHR2YWx1ZTs8YnI+DQorLcKgIMKgIMKgIMKgIMKgIC8q
PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCogdGFnIGlmIHNvbWUgZGVhbGxvY2F0aW9uIGlzIG5l
ZWRlZDxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCistwqAgwqAgwqAgwqAgwqAgaWYg
KGFsbG9jICE9IDApIGF0dHZhbCA9IDE7PGJyPg0KKy3CoCDCoCDCoCB9IGVsc2Ugezxicj4NCist
wqAgwqAgwqAgwqAgwqAgaWYgKChhdHR2YWx1ZSAhPSBOVUxMKSAmYW1wOyZhbXA7IChhdHR2YWx1
ZVtsZW5dID09IDApKTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgeG1sRnJlZShhdHR2YWx1
ZSk7PGJyPg0KKy3CoCDCoCDCoCB9PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCAvKjxicj4NCisr
wqAgwqAgwqAgwqAgwqAgwqAgwqAqIGNoZWNrIHRoYXQgaXQmIzM5O3Mgbm90IGEgZGVmaW5lZCBu
YW1lc3BhY2U8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQorK8KgIMKgIMKgIMKg
IMKgIMKgIGZvciAoaiA9IDE7aiAmbHQ7PSBuYk5zO2orKyk8YnI+DQorK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGlmIChjdHh0LSZndDtuc1RhYltjdHh0LSZndDtuc05yIC0gMiAqIGpdID09IGF0
dG5hbWUpPGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQor
K8KgIMKgIMKgIMKgIMKgIMKgIGlmIChqICZsdDs9IG5iTnMpPGJyPg0KKyvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB4bWxFcnJBdHRyaWJ1dGVEdXAoY3R4dCwgYXByZWZpeCwgYXR0bmFtZSk7PGJy
Pg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBlbHNlPGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBpZiAobnNQdXNoKGN0eHQsIGF0dG5hbWUsIFVSTCkgJmd0OyAwKSBuYk5zKys7PGJyPg0KKys8
YnI+DQorK8KgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCAvKjxi
cj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAqIEFkZCB0aGUgcGFpciB0byBhdHRzPGJyPg0KKyvC
oCDCoCDCoCDCoCDCoCDCoCDCoCovPGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBpZiAoKGF0dHMg
PT0gTlVMTCkgfHwgKG5iYXR0cyArIDUgJmd0OyBtYXhhdHRzKSkgezxicj4NCisrwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaWYgKHhtbEN0eHRHcm93QXR0cnMoY3R4dCwgbmJhdHRzICsgNSkgJmx0
OyAwKSB7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIG5leHRfYXR0
cjs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQorK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIG1heGF0dHMgPSBjdHh0LSZndDttYXhhdHRzOzxicj4NCisrwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgYXR0cyA9IGN0eHQtJmd0O2F0dHM7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDC
oCB9PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBjdHh0LSZndDthdHRhbGxvY3NbbnJhdHRzKytd
ID0gYWxsb2M7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBhdHRzW25iYXR0cysrXSA9IGF0dG5h
bWU7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBhdHRzW25iYXR0cysrXSA9IGFwcmVmaXg7PGJy
Pg0KKyvCoCDCoCDCoCDCoCDCoCDCoCAvKjxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAqIFRo
ZSBuYW1lc3BhY2UgVVJJIGZpZWxkIGlzIHVzZWQgdGVtcG9yYXJpbHkgdG8gcG9pbnQgYXQgdGhl
PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCogYmFzZSBvZiB0aGUgY3VycmVudCBpbnB1dCBi
dWZmZXIgZm9yIG5vbi1hbGxvY2VkIGF0dHJpYnV0ZXMuPGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDC
oCDCoCogV2hlbiB0aGUgaW5wdXQgYnVmZmVyIGlzIHJlYWxsb2NhdGVkLCBhbGwgdGhlIHBvaW50
ZXJzIGJlY29tZTxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAqIGludmFsaWQsIGJ1dCB0aGV5
IGNhbiBiZSByZWNvbnN0cnVjdGVkIGxhdGVyLjxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAq
Lzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGFsbG9jKTxicj4NCisrwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgYXR0c1tuYmF0dHMrK10gPSBOVUxMOzxicj4NCisrwqAgwqAgwqAgwqAgwqAg
wqAgZWxzZTxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXR0c1tuYmF0dHMrK10gPSBj
dHh0LSZndDtpbnB1dC0mZ3Q7YmFzZTs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIGF0dHNbbmJh
dHRzKytdID0gYXR0dmFsdWU7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBhdHR2YWx1ZSArPSBs
ZW47PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBhdHRzW25iYXR0cysrXSA9IGF0dHZhbHVlOzxi
cj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgLyo8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgKiB0
YWcgaWYgc29tZSBkZWFsbG9jYXRpb24gaXMgbmVlZGVkPGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDC
oCDCoCovPGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBpZiAoYWxsb2MgIT0gMCkgYXR0dmFsID0g
MTs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIGF0dHZhbHVlID0gTlVMTDsgLyogbW92ZWQgaW50
byBhdHRzICovPGJyPg0KKyvCoCDCoCDCoCDCoCB9PGJyPg0KKzxicj4NCistZmFpbGVkOjxicj4N
CisrbmV4dF9hdHRyOjxicj4NCisrwqAgwqAgwqAgwqAgaWYgKChhdHR2YWx1ZSAhPSBOVUxMKSAm
YW1wOyZhbXA7IChhbGxvYyAhPSAwKSkgezxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgeG1sRnJl
ZShhdHR2YWx1ZSk7PGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCBhdHR2YWx1ZSA9IE5VTEw7PGJy
Pg0KKyvCoCDCoCDCoCDCoCB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoEdST1c8YnI+DQorwqAg
wqAgwqAgwqAgwqBpZiAoY3R4dC0mZ3Q7aW5zdGF0ZSA9PSBYTUxfUEFSU0VSX0VPRik8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorLcKgIMKgIMKgIGlmICgoY3R4dC0mZ3Q7
aW5wdXQtJmd0O2Jhc2UgIT0gYmFzZSkgfHwgKGlucHV0TnIgIT0gY3R4dC0mZ3Q7aW5wdXROcikp
PGJyPg0KKy3CoCDCoCDCoCDCoCDCoCBnb3RvIGJhc2VfY2hhbmdlZDs8YnI+DQorwqAgwqAgwqAg
wqBpZiAoKFJBVyA9PSAmIzM5OyZndDsmIzM5OykgfHwgKCgoUkFXID09ICYjMzk7LyYjMzk7KSAm
YW1wOyZhbXA7IChOWFQoMSkgPT0gJiMzOTsmZ3Q7JiMzOTspKSkpPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKCFJU19CTEFOS19DSChSQVcpKSB7PGJy
Pg0KK0BAIC05NjQ2LDggKzk2MTAsMjAgQEAgZmFpbGVkOjxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAgwqBHUk9XOzxicj4N
CistwqAgwqAgwqAgaWYgKChjdHh0LSZndDtpbnB1dC0mZ3Q7YmFzZSAhPSBiYXNlKSB8fCAoaW5w
dXROciAhPSBjdHh0LSZndDtpbnB1dE5yKSk8YnI+DQorLcKgIMKgIMKgIMKgIMKgIGdvdG8gYmFz
ZV9jaGFuZ2VkOzxicj4NCisrwqAgwqAgfTxicj4NCisrPGJyPg0KKyvCoCDCoCAvKiBSZWNvbnN0
cnVjdCBhdHRyaWJ1dGUgdmFsdWUgcG9pbnRlcnMuICovPGJyPg0KKyvCoCDCoCBmb3IgKGkgPSAw
LCBqID0gMDsgaiAmbHQ7IG5yYXR0czsgaSArPSA1LCBqKyspIHs8YnI+DQorK8KgIMKgIMKgIMKg
IGlmIChhdHRzW2krMl0gIT0gTlVMTCkgezxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgLyo8YnI+
DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgKiBBcml0aG1ldGljIG9uIGRhbmdsaW5nIHBvaW50ZXJz
IGlzIHRlY2huaWNhbGx5IHVuZGVmaW5lZDxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAqIGJl
aGF2aW9yLCBidXQgd2VsbC4uLjxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCisr
wqAgwqAgwqAgwqAgwqAgwqAgcHRyZGlmZl90IG9mZnNldCA9IGN0eHQtJmd0O2lucHV0LSZndDti
YXNlIC0gYXR0c1tpKzJdOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgYXR0c1tpKzJdwqAgPSBO
VUxMO8KgIMKgIC8qIFJlc2V0IHJlcHVycG9zZWQgbmFtZXNwYWNlIFVSSSAqLzxicj4NCisrwqAg
wqAgwqAgwqAgwqAgwqAgYXR0c1tpKzNdICs9IG9mZnNldDvCoCAvKiB2YWx1ZSAqLzxicj4NCisr
wqAgwqAgwqAgwqAgwqAgwqAgYXR0c1tpKzRdICs9IG9mZnNldDvCoCAvKiB2YWx1ZW5kICovPGJy
Pg0KKyvCoCDCoCDCoCDCoCB9PGJyPg0KK8KgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAv
Kjxicj4NCitAQCAtOTgwNCwzNCArOTc4MCw2IEBAIGZhaWxlZDo8YnI+DQorwqAgwqAgwqB9PGJy
Pg0KKzxicj4NCivCoCDCoCDCoHJldHVybihsb2NhbG5hbWUpOzxicj4NCistPGJyPg0KKy1iYXNl
X2NoYW5nZWQ6PGJyPg0KKy3CoCDCoCAvKjxicj4NCistwqAgwqAgwqAqIHRoZSBhdHRyaWJ1dGUg
c3RyaW5ncyBhcmUgdmFsaWQgaWlmIHRoZSBiYXNlIGRpZG4mIzM5O3QgY2hhbmdlZDxicj4NCist
wqAgwqAgwqAqLzxicj4NCistwqAgwqAgaWYgKGF0dHZhbCAhPSAwKSB7PGJyPg0KKy3CoCDCoCDC
oCBmb3IgKGkgPSAzLGogPSAwOyBqICZsdDsgbnJhdHRzO2kgKz0gNSxqKyspPGJyPg0KKy3CoCDC
oCDCoCDCoCDCoCBpZiAoKGN0eHQtJmd0O2F0dGFsbG9jc1tqXSAhPSAwKSAmYW1wOyZhbXA7IChh
dHRzW2ldICE9IE5VTEwpKTxicj4NCistwqAgwqAgwqAgwqAgwqAgwqAgwqAgeG1sRnJlZSgoeG1s
Q2hhciAqKSBhdHRzW2ldKTs8YnI+DQorLcKgIMKgIH08YnI+DQorLTxicj4NCistwqAgwqAgLyo8
YnI+DQorLcKgIMKgIMKgKiBXZSBjYW4mIzM5O3Qgc3dpdGNoIGZyb20gb25lIGVudGl0eSB0byBh
bm90aGVyIGluIHRoZSBtaWRkbGU8YnI+DQorLcKgIMKgIMKgKiBvZiBhIHN0YXJ0IHRhZzxicj4N
CistwqAgwqAgwqAqLzxicj4NCistwqAgwqAgaWYgKGlucHV0TnIgIT0gY3R4dC0mZ3Q7aW5wdXRO
cikgezxicj4NCistwqAgwqAgwqAgwqAgeG1sRmF0YWxFcnJNc2coY3R4dCwgWE1MX0VSUl9FTlRJ
VFlfQk9VTkRBUlksPGJyPg0KKy3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDtTdGFy
dCB0YWcgZG9lc24mIzM5O3Qgc3RhcnQgYW5kIHN0b3AgaW4gdGhlIHNhbWUgZW50aXR5XG4mcXVv
dDspOzxicj4NCistwqAgwqAgwqAgcmV0dXJuKE5VTEwpOzxicj4NCistwqAgwqAgfTxicj4NCist
PGJyPg0KKy3CoCDCoCBjdHh0LSZndDtpbnB1dC0mZ3Q7Y3VyID0gY3R4dC0mZ3Q7aW5wdXQtJmd0
O2Jhc2UgKyBjdXI7PGJyPg0KKy3CoCDCoCBjdHh0LSZndDtpbnB1dC0mZ3Q7bGluZSA9IG9sZGxp
bmU7PGJyPg0KKy3CoCDCoCBjdHh0LSZndDtpbnB1dC0mZ3Q7Y29sID0gb2xkY29sOzxicj4NCist
wqAgwqAgaWYgKGN0eHQtJmd0O3dlbGxGb3JtZWQgPT0gMSkgezxicj4NCistwqAgwqAgwqAgZ290
byByZXBhcnNlOzxicj4NCistwqAgwqAgfTxicj4NCistwqAgwqAgcmV0dXJuKE5VTEwpOzxicj4N
CisgfTxicj4NCis8YnI+DQorIC8qKjxicj4NCitkaWZmIC0tZ2l0IGEvcmVzdWx0L2Vycm9ycy83
NTkzOTgueG1sLmVyciBiL3Jlc3VsdC9lcnJvcnMvNzU5Mzk4LnhtbC5lcnI8YnI+DQoraW5kZXgg
ZTA4ZDliZi4uZjYwMzZhMyAxMDA2NDQ8YnI+DQorLS0tIGEvcmVzdWx0L2Vycm9ycy83NTkzOTgu
eG1sLmVycjxicj4NCisrKysgYi9yZXN1bHQvZXJyb3JzLzc1OTM5OC54bWwuZXJyPGJyPg0KK0BA
IC0xLDkgKzEsMTIgQEA8YnI+DQorIC4vdGVzdC9lcnJvcnMvNzU5Mzk4LnhtbDoyMTA6IHBhcnNl
ciBlcnJvciA6IFN0YXJ0VGFnOiBpbnZhbGlkIGVsZW1lbnQgbmFtZTxicj4NCisgbmVlZCB0byB3
b3JyeSBhYm91dCBwYXJzZXJzIHdoaSZsdDshIGRvbiYjMzk7dCBleHBhbmQgUEVyZWZzIGZpbmRp
bmc8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBePGJyPg0KKy0uL3Rlc3QvZXJyb3JzLzc1OTM5OC54bWw6PHdicj4zMDk6IHBhcnNlciBlcnJv
ciA6IE9wZW5pbmcgYW5kIGVuZGluZyB0YWcgbWlzbWF0Y2g6IHNwZWMgbGluZSA1MCBhbmQgdGVy
bWRlZjxicj4NCisrLi90ZXN0L2Vycm9ycy83NTkzOTgueG1sOjx3YnI+MzA5OiBwYXJzZXIgZXJy
b3IgOiBPcGVuaW5nIGFuZCBlbmRpbmcgdGFnIG1pc21hdGNoOiDihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJY8d2JyPuKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEljx3YnI+
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSWPHdicj7ihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJY8d2JyPuKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEljx3YnI+
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSWPHdicj7ihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJY8d2JyPuKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEljx3YnI+
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSWPHdicj7ihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJY8d2JyPuKEluKEluKEliE8YnI+DQrCoOKEluKEluKEljxicj4NCsKg4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSWPHdicj7ihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJY8d2JyPuKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEljx3YnI+4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSWPHdicj7ihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJY8d2JyPuKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEljx3YnI+4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSWPHdicj7ihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJY8d2JyPuKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEljx3YnI+4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSWPHdicj7ihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJY8d2JyPsOiITxicj4NCsKg77+977+94oSW4oSWw6I8YnI+DQrCoO+/ve+/veKEluKE
luKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEljx3YnI+4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSWPHdicj7ihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJY8d2JyPuKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEljx3YnI+4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSWPHdicj7ihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJY8d2JyPuKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEljx3YnI+4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSWPHdicj7ihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJY8d2JyPuKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEljx3YnI+4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSWPHdicj7vv73igJ4hPGJyPg0KwqDvv73ihJbihJbvv73igJ48YnI+DQrCoO+/veKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEljx3YnI+4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSWPHdicj7ihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbi
hJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJbihJY8d2JyPuKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKEluKE
luKEluKEluKEluKEluKEluKEluKEljx3YnI+4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW
4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSW4oSWbSBsaW5lIDMwOCBhbmQgdGVybWRlZjxicj4NCisg
YW5kIHByb3ZpZGUgYWNjZXNzIHRvIHRoZWlyIGNvbnRlbnQgYW5kIHN0cnVjdHVyZS4mbHQ7L3Rl
cm1kZWYmZ3Q7ICZsdDt0ZXJtZGVmPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgXjxicj4NCistLi90ZXN0L2Vycm9ycy83NTkzOTgueG1sOjx3YnI+MzA5OiBwYXJzZXIg
ZXJyb3IgOiBFeHRyYSBjb250ZW50IGF0IHRoZSBlbmQgb2YgdGhlIGRvY3VtZW50PGJyPg0KKy1h
bmQgcHJvdmlkZSBhY2Nlc3MgdG8gdGhlaXIgY29udGVudCBhbmQgc3RydWN0dXJlLiZsdDsvdGVy
bWRlZiZndDsgJmx0O3Rlcm1kZWY8YnI+DQorLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgXjxicj4NCisrLi90ZXN0L2Vycm9ycy83NTkzOTgueG1sOjx3YnI+MzE0OiBwYXJzZXIg
ZXJyb3IgOiBPcGVuaW5nIGFuZCBlbmRpbmcgdGFnIG1pc21hdGNoOiBzcGVjIGxpbmUgNTAgYW5k
IHA8YnI+DQorK2RhdGEgYW5kIHRoZSBpbmZvcm1hdGlvbiBpdCBtdXN0IHByb3ZpZGUgdG8gdGhl
IGFwcGxpY2F0aW9uLiZsdDsvcCZndDs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIF48YnI+DQorKy4vdGVzdC9lcnJvcnMvNzU5Mzk4LnhtbDo8d2JyPjMxNjog
cGFyc2VyIGVycm9yIDogRXh0cmEgY29udGVudCBhdCB0aGUgZW5kIG9mIHRoZSBkb2N1bWVudDxi
cj4NCisrJmx0O2RpdjIgaWQ9JiMzOTtzZWMtb3JpZ2luLWdvYWxzJiMzOTsmZ3Q7PGJyPg0KKyte
PGJyPg0KK2RpZmYgLS1naXQgYS9yZXN1bHQvZXJyb3JzL2F0dHIxLnhtbC5lcnIgYi9yZXN1bHQv
ZXJyb3JzL2F0dHIxLnhtbC5lcnI8YnI+DQoraW5kZXggNGYwODUzOC4uYzRjNGZjOCAxMDA2NDQ8
YnI+DQorLS0tIGEvcmVzdWx0L2Vycm9ycy9hdHRyMS54bWwuZXJyPGJyPg0KKysrKyBiL3Jlc3Vs
dC9lcnJvcnMvYXR0cjEueG1sLmVycjxicj4NCitAQCAtMSw2ICsxLDkgQEA8YnI+DQorIC4vdGVz
dC9lcnJvcnMvYXR0cjEueG1sOjI6IHBhcnNlciBlcnJvciA6IEF0dFZhbHVlOiAmIzM5OyBleHBl
Y3RlZDxicj4NCis8YnI+DQorIF48YnI+DQorLS4vdGVzdC9lcnJvcnMvYXR0cjEueG1sOjE6IHBh
cnNlciBlcnJvciA6IEV4dHJhIGNvbnRlbnQgYXQgdGhlIGVuZCBvZiB0aGUgZG9jdW1lbnQ8YnI+
DQorLSZsdDtmb28gZm9vPSZxdW90Ozx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29v
PHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb288YnI+DQor
LSBePGJyPg0KKysuL3Rlc3QvZXJyb3JzL2F0dHIxLnhtbDoyOiBwYXJzZXIgZXJyb3IgOiBhdHRy
aWJ1dGVzIGNvbnN0cnVjdCBlcnJvcjxicj4NCisrPGJyPg0KKytePGJyPg0KKysuL3Rlc3QvZXJy
b3JzL2F0dHIxLnhtbDoyOiBwYXJzZXIgZXJyb3IgOiBDb3VsZG4mIzM5O3QgZmluZCBlbmQgb2Yg
U3RhcnQgVGFnIGZvbyBsaW5lIDE8YnI+DQorKzxicj4NCisrXjxicj4NCitkaWZmIC0tZ2l0IGEv
cmVzdWx0L2Vycm9ycy9hdHRyMi54bWwuZXJyIGIvcmVzdWx0L2Vycm9ycy9hdHRyMi54bWwuZXJy
PGJyPg0KK2luZGV4IGM4YTljN2QuLjc3ZTM0MmUgMTAwNjQ0PGJyPg0KKy0tLSBhL3Jlc3VsdC9l
cnJvcnMvYXR0cjIueG1sLmVycjxicj4NCisrKysgYi9yZXN1bHQvZXJyb3JzL2F0dHIyLnhtbC5l
cnI8YnI+DQorQEAgLTEsNiArMSw5IEBAPGJyPg0KKyAuL3Rlc3QvZXJyb3JzL2F0dHIyLnhtbDoy
OiBwYXJzZXIgZXJyb3IgOiBBdHRWYWx1ZTogJiMzOTsgZXhwZWN0ZWQ8YnI+DQorPGJyPg0KKyBe
PGJyPg0KKy0uL3Rlc3QvZXJyb3JzL2F0dHIyLnhtbDoxOiBwYXJzZXIgZXJyb3IgOiBFeHRyYSBj
b250ZW50IGF0IHRoZSBlbmQgb2YgdGhlIGRvY3VtZW50PGJyPg0KKy0mbHQ7Zm9vIGZvbz0mcXVv
dDsmZ3Q7PHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29v
b29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vPGJyPg0KKy0gXjxicj4NCisrLi90ZXN0
L2Vycm9ycy9hdHRyMi54bWw6MjogcGFyc2VyIGVycm9yIDogYXR0cmlidXRlcyBjb25zdHJ1Y3Qg
ZXJyb3I8YnI+DQorKzxicj4NCisrXjxicj4NCisrLi90ZXN0L2Vycm9ycy9hdHRyMi54bWw6Mjog
cGFyc2VyIGVycm9yIDogQ291bGRuJiMzOTt0IGZpbmQgZW5kIG9mIFN0YXJ0IFRhZyBmb28gbGlu
ZSAxPGJyPg0KKys8YnI+DQorK148YnI+DQorZGlmZiAtLWdpdCBhL3Jlc3VsdC9lcnJvcnMvbmFt
ZTIueG1sLmVyciBiL3Jlc3VsdC9lcnJvcnMvbmFtZTIueG1sLmVycjxicj4NCitpbmRleCBhNjY0
OWExLi44YTZhY2VlIDEwMDY0NDxicj4NCistLS0gYS9yZXN1bHQvZXJyb3JzL25hbWUyLnhtbC5l
cnI8YnI+DQorKysrIGIvcmVzdWx0L2Vycm9ycy9uYW1lMi54bWwuZXJyPGJyPg0KK0BAIC0xLDYg
KzEsOSBAQDxicj4NCisgLi90ZXN0L2Vycm9ycy9uYW1lMi54bWw6MjogcGFyc2VyIGVycm9yIDog
U3BlY2lmaWNhdGlvbiBtYW5kYXRlIHZhbHVlIGZvciBhdHRyaWJ1dGUgZm9vb29vb29vb29vb29v
b29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9v
b29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29v
b29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29v
b29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdi
cj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29v
b29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29v
b29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29v
bzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29v
b29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29v
b29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29v
b29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29v
b29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2Jy
Pm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29v
b29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29v
b29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29v
PHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29v
b29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29v
b29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29v
b29vbzx3YnI+b29vITxicj4NCsKgb29vb29vb29vPGJyPg0KwqBvb29vb29vb29vb29vb29vb29v
b29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29v
b29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29v
b288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29v
b29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9v
b29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29v
b29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29v
b29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdi
cj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29v
b29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29v
b29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29v
bzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29v
b29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29v
b29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29v
b29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29v
b29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2Jy
Pm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29v
b29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29v
b29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29v
PHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29v
b29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vbyE8YnI+DQrCoG9v
b29vb29vbzxicj4NCsKgb29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29v
b29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29v
bzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29v
b29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29v
b29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29v
b29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29v
b29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2Jy
Pm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29v
b29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29v
b29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29v
PHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29v
b29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29v
b29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29v
b29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29v
b29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+
b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29v
b29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29v
b29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288
d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29v
b29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29v
b29vb29vb29vb29vb29vb29vb29vb28hPGJyPg0KwqBvb29vb29vb288YnI+DQrCoG9vb29vb29v
b29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29v
PHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29v
b29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29v
b29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29v
b29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29v
b29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+
b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29v
b29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29v
b29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288
d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29v
b29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29v
b29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29v
b29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29v
b29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5v
b29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29v
b29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29v
b29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3
YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29v
b29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29v
b29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29v
ITxicj4NCsKgb29vb29vb29vPGJyPg0KwqBvb29vb29vb29vb29vb29vb29vb29vb29vb29vb288
d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29v
b29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29v
b29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29v
b29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29v
b29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5v
b29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29v
b29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29v
b29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3
YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29v
b29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29v
b29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29v
b288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29v
b29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9v
b29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29v
b29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29v
b29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdi
cj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29v
b29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29v
b29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29v
bzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vbyE8YnI+DQrCoG9vb29vb29vbzxicj4N
CsKgb29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29v
b29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29v
b29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29v
b288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29v
b29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9v
b29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29v
b29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29v
b29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdi
cj5vb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29v
b29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29v
b29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29v
bzx3YnI+b29vb29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29v
b29vb29vb29vb29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29v
b29vb29vb29vb29vb29vb29vb29vb29vb29vPHdicj5vb29vb29vb29vb29vb29vb29vb29vb29v
b29vb288d2JyPm9vb29vb29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29v
b29vb29vb29vPGJyPg0KKzxicj4NCisgXjxicj4NCistLi90ZXN0L2Vycm9ycy9uYW1lMi54bWw6
MTogcGFyc2VyIGVycm9yIDogRXh0cmEgY29udGVudCBhdCB0aGUgZW5kIG9mIHRoZSBkb2N1bWVu
dDxicj4NCistJmx0O2ZvbyBmb29vb29vb29vb29vb29vb29vb29vb29vb29vb288d2JyPm9vb29v
b29vb29vb29vb29vb29vb29vb29vb29vbzx3YnI+b29vb29vb29vb29vb29vPGJyPg0KKy0gXjxi
cj4NCisrLi90ZXN0L2Vycm9ycy9uYW1lMi54bWw6MjogcGFyc2VyIGVycm9yIDogYXR0cmlidXRl
cyBjb25zdHJ1Y3QgZXJyb3I8YnI+DQorKzxicj4NCisrXjxicj4NCisrLi90ZXN0L2Vycm9ycy9u
YW1lMi54bWw6MjogcGFyc2VyIGVycm9yIDogQ291bGRuJiMzOTt0IGZpbmQgZW5kIG9mIFN0YXJ0
IFRhZyBmb28gbGluZSAxPGJyPg0KKys8YnI+DQorK148YnI+DQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvbGlieG1sLzxhIGhyZWY9Imh0dHA6Ly9saWJ4bWwyXzIuOS40LmJiIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWI8d2JyPnhtbDJfMi45LjQuYmI8L2E+IGIv
bWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sLzxhIGhyZWY9Imh0dHA6Ly9saWJ4bWwyXzIuOS40LmJi
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5saWI8d2JyPnhtbDJfMi45LjQuYmI8
L2E+PGJyPg0KaW5kZXggNGY2MDc4MS4uMDU3N2FkNiAxMDA2NDQ8YnI+DQotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS9saWJ4bWwvPGEgaHJlZj0iaHR0cDovL2xpYnhtbDJfMi45LjQuYmIiIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYjx3YnI+eG1sMl8yLjkuNC5iYjwvYT48YnI+
DQorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvPGEgaHJlZj0iaHR0cDovL2xpYnhtbDJf
Mi45LjQuYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmxpYjx3YnI+eG1sMl8y
LjkuNC5iYjwvYT48YnI+DQpAQCAtMjMsNiArMjMsNyBAQCBTUkNfVVJJID0gJnF1b3Q7PGEgaHJl
Zj0iZnRwOi8veG1sc29mdC5vcmcvbGlieG1sMi9saWJ4bWwyLSR7UFZ9LnRhci5nejtuYW1lPWxp
YnRhciIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+ZnRwOi8veG1sc29mdC5vcmcv
bGlieG1sMi88d2JyPmxpYnhtbDItJHtQVn0udGFyLmd6O25hbWU9PHdicj5saWJ0YXI8L2E+IFw8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCBmaWxlOi8vbGlieG1sMi1DVkUtMjAxNi01MTMxLjx3YnI+
cGF0Y2ggXDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIGZpbGU6Ly9saWJ4bWwyLUNWRS0yMDE2LTQ2
NTguPHdicj5wYXRjaCBcPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgZmlsZTovL2xpYnhtbDItZml4
X05VTExfPHdicj5wb2ludGVyX2RlcmVmcy5wYXRjaCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
ZmlsZTovL2xpYnhtbDItZml4X2FuZF88d2JyPnNpbXBsaWZ5X3htbFBhcnNlU3RhcnRUYWcyLjx3
YnI+cGF0Y2ggXDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIGZpbGU6Ly9DVkUtMjAxNi05MzE4LnBh
dGNoIFw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCBmaWxlOi8vMDAwMS1NYWtlLXB0ZXN0LXJ1bi08
d2JyPnRoZS1weXRob24tdGVzdHMtaWYtcHl0aG9uLWlzLTx3YnI+ZW5hYmxlZC5wYXRjaCBcPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7PGJyPg0KLS08YnI+DQoyLjEuNDxicj4NCjxicj4N
CjwvZGl2PjwvZGl2Pjxicj4tLTxicj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzx3
YnI+X19fX19fX19fX19fX19fX188YnI+DQpPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3Q8
YnI+DQo8YSBocmVmPSJtYWlsdG86T3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyI+T3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMuPHdicj5vcGVuZW1iZWRkZWQub3JnPC9hPjxi
cj4NCjxhIGhyZWY9Imh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbmVtYmVkZGVkLWNvcmUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnLzx3YnI+bWFpbG1hbi9saXN0aW5mby9vcGVuZW1i
ZWRkZWQtPHdicj5jb3JlPC9hPjxicj4NCjxicj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2
Pg0K

--001a1147e5f85436e40551fea0d1--
