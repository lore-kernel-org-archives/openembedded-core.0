Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
	[209.85.221.176])
	by mail.openembedded.org (Postfix) with ESMTP id CAD8C7FA30
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 20:26:58 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id l5so2687898vkb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 12:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C3IZiWfYIL0oJmFnHxxEZXKI/EUnyEPF+uYSdM2Ugjk=;
	b=je7BDlDCJPDntnd7IV172vab4OeM7t5KKs51ujTEwZyaL2Crp7b1AECMQJJwLlOuNZ
	kGRJrF5oZx7cuS6TgvkI2jc/y7YIVDaVu0h2EbMu0teVZGnEVy0HrAtmfqLC+u1ixeh3
	TMOjR5QAsFitvDtZVBilh6ftGIf6WrErRnMg86hqZOB+veFusdMptkbGr/E0OmywUR9q
	+OajlSZc/WAQGyopACfLqS0V666ADpk6BzAtIOaakr+eLJytQ5DMPDO4czvMNiVgEtoj
	lVyxFkph6LiTWRMuhwncKyq4Nok/3q/B7Mpt2b1a2BBdHZj6jcgK9L8bbJxR4ZwYcEWI
	NCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C3IZiWfYIL0oJmFnHxxEZXKI/EUnyEPF+uYSdM2Ugjk=;
	b=EivgfM/VL0adZXZTlO9cn29evCyZXpEqI0FLYREnCOchXn+ZgB3I82eJgiT1sqAZEG
	o6qKOOxS7+EzBH5McyhuHtq2wQC+cWZRycPkJo76wEvmk4dzC96M3P1AKkV9qg52dP+w
	zh2coK/UDxYMWgHn0XaSIf6tTQICRVQKwotj/rwdpOMMVcJrlsdHxRw3ly6dX9E5NgoD
	a2Cd95mFwh2H7cLLvVRGs88cbDAdzkCaS3Cle9Bs4VF+mY0rjGeJE7eLLqmXngml6H56
	U2Ohjhtsc3fiuTMA10pYkKXfO41XYS2zKnzmHt/7qQ2DMBO5fjsjDHttkMBi/CORLCyC
	q2GQ==
X-Gm-Message-State: APjAAAW1SrVmUubWe6kREBXV38LZq/X5yVJDV4s1jGAINM0SdXXCl7KF
	0VZ5CdkZ7LgavzyZh2Rkha77w5ILcKKnwMzD/4fczw==
X-Google-Smtp-Source: APXvYqw+fDCjXhDmtgTjOVYS+DcEpGJxNGsP2BYzEwqE+cMWvJXla+r8RQZCLUjgTBkkLL+WZ6TNtALP6baBmHIe7mg=
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr13313785vkn.0.1575664019244; 
	Fri, 06 Dec 2019 12:26:59 -0800 (PST)
MIME-Version: 1.0
References: <20191206200915.25807-1-Trevor.Gamblin@windriver.com>
In-Reply-To: <20191206200915.25807-1-Trevor.Gamblin@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Dec 2019 21:26:47 +0100
Message-ID: <CANNYZj8jpj43pexxPrnt81rTHEdB6w6BSL2ve_ront2RFFHNNw@mail.gmail.com>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ghostscript: upgrade 9.27 -> 9.50
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
X-List-Received-Date: Fri, 06 Dec 2019 20:26:59 -0000
Content-Type: multipart/alternative; boundary="0000000000002708d505990ede28"

--0000000000002708d505990ede28
Content-Type: text/plain; charset="UTF-8"

If the fix for 2019-14869 is included in 9.50, why the patch for it is not
removed?

Alex

On Fri, 6 Dec 2019 at 21:09, Trevor Gamblin <Trevor.Gamblin@windriver.com>
wrote:

> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Version 9.50 incorporates a fix for CVE-2019-14869 as well as
> previously-backported fixes for CVE-2019-14811 and CVE-2019-14817.
>
> CVE: CVE-2019-14869
> CVE: CVE-2019-14811
> CVE: CVE-2019-14817
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../ghostscript/CVE-2019-14811-0001.patch     |  69 -----
>  .../ghostscript/CVE-2019-14817-0001.patch     | 270 ------------------
>  .../ghostscript/CVE-2019-14817-0002.patch     | 236 ---------------
>  ...hostscript_9.27.bb => ghostscript_9.50.bb} |   9 +-
>  4 files changed, 3 insertions(+), 581 deletions(-)
>  delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
>  delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch
>  delete mode 100644
> meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch
>  rename meta/recipes-extended/ghostscript/{ghostscript_9.27.bb =>
> ghostscript_9.50.bb} (92%)
>
> diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
> b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
> deleted file mode 100644
> index d4ef0996ec..0000000000
> ---
> a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -From 885444fcbe10dc42787ecb76686c8ee4dd33bf33 Mon Sep 17 00:00:00 2001
> -From: Ken Sharp <ken.sharp@artifex.com>
> -Date: Tue, 20 Aug 2019 10:10:28 +0100
> -Subject: [PATCH] make .forceput inaccessible
> -
> -Bug #701343, #701344, #701345
> -
> -More defensive programming. We don't want people to access .forecput
> -even though it is no longer sufficient to bypass SAFER. The exploit
> -in #701343 didn't work anyway because of earlier work to stop the error
> -handler being used, but nevertheless, prevent access to .forceput from
> -.setuserparams2.
> -
> -CVE: CVE-2019-14811
> -CVE: CVE-2019-14813
> -Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
> -
> -Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> ----
> - Resource/Init/gs_lev2.ps  | 6 +++---
> - Resource/Init/gs_pdfwr.ps | 4 ++--
> - 2 files changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/Resource/Init/gs_lev2.ps b/Resource/Init/gs_lev2.ps
> -index 98d55fe..f1b771f 100644
> ---- a/Resource/Init/gs_lev2.ps
> -+++ b/Resource/Init/gs_lev2.ps
> -@@ -158,7 +158,7 @@ end
> -     {
> -       pop pop
> -     } ifelse
> --  } forall
> -+  } executeonly forall
> -         % A context switch might have occurred during the above loop,
> -         % causing the interpreter-level parameters to be reset.
> -         % Set them again to the new values.  From here on, we are safe,
> -@@ -229,9 +229,9 @@ end
> -        { pop pop
> -        }
> -       ifelse
> --    }
> -+    } executeonly
> -    forall pop
> --} .bind odef
> -+} .bind executeonly odef
> -
> - % Initialize the passwords.
> - % NOTE: the names StartJobPassword and SystemParamsPassword are known to
> -diff --git a/Resource/Init/gs_pdfwr.ps b/Resource/Init/gs_pdfwr.ps
> -index 00c19fa..dfe504d 100644
> ---- a/Resource/Init/gs_pdfwr.ps
> -+++ b/Resource/Init/gs_pdfwr.ps
> -@@ -652,11 +652,11 @@ currentdict /.pdfmarkparams .undef
> -           systemdict /.pdf_hooked_DSC_Creator //true .forceput
> -         } executeonly if
> -         pop
> --      } if
> -+      } executeonly if
> -     } {
> -       pop
> -     } ifelse
> --  }
> -+  } executeonly
> -   {
> -     pop
> -   } ifelse
> ---
> -2.20.1
> -
> diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch
> b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch
> deleted file mode 100644
> index c76e21caa6..0000000000
> ---
> a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch
> +++ /dev/null
> @@ -1,270 +0,0 @@
> -From 0bafbd9c1273fab0dc79fd20db0ffc4443683f96 Mon Sep 17 00:00:00 2001
> -From: Ken Sharp <ken.sharp@artifex.com>
> -Date: Mon, 29 Apr 2019 11:14:06 +0100
> -Subject: [PATCH 1/2] PDF interpreter - Decode ToUnicode entries of the
> form
> - /Identity-H/V
> -
> -Bug #701003 "Text searchability broken due to omission of /ToUnicode
> /Identity-H"
> -
> -The PDF references from 1.2 too 2.0 all state that the value associated
> -with a ToUnicode key in a FontDescriptor must be a stream object. However
> -this file (and one case seen previously, bug 687351) have FontDescriptor
> -dictionaries where the value associated with a /ToUnicode key is a
> -name object, in both cases /Identity-H.
> -
> -Although this is clearly not legal, Acrobat not only tolerates it, it
> -actually uses it for search/copy/paste (see bug 701003 for details).
> -Without the key Acrobat is unable to successfully search the output file.
> -
> -We can't simply preserve the name object as a ToUnicode value; when
> -handling ToUnicode we actually decode the CMap and build a
> -GlyphNames2Unicode map (an internal representation of the G2U data
> -produced by the Microsoft PostScript printer driver). When writing the
> -output file we use that information to get a Unicode value for each
> -character we write, and build a new ToUnicode CMap using that.
> -
> -This commit tackles the problem by pre-scanning for a name object and
> -then checking to see if its Identity-H or Identity-V (although we have
> -not seen an Identity-V, there seems no reason why it wouldn't be
> -equally valid). If we find either of these then we construct a
> -GlyphNames2Unicode table for all possible values (0 - 65535) and store
> -that with the font as normal. When we write the output file we only
> -write the required entries for the subset font, so we write a now
> -completely legal ToUnicode CMap, and Acrobat is equally happy with that
> -as the original name.
> -
> -If the ToUnicode value isn't a name object, or isn't one of the
> -identities then we proceed as before. This means we will print a
> -warning for non conforming ToUnicode entries and ignore them.
> -
> -CVE: CVE-2019-14817
> -Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
> -
> -Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> ----
> - Resource/Init/pdf_font.ps | 200 ++++++++++++++++++++++++--------------
> - 1 file changed, 129 insertions(+), 71 deletions(-)
> -
> -diff --git a/Resource/Init/pdf_font.ps b/Resource/Init/pdf_font.ps
> -index 9fb85f6..2df3303 100644
> ---- a/Resource/Init/pdf_font.ps
> -+++ b/Resource/Init/pdf_font.ps
> -@@ -621,86 +621,144 @@ currentdict end readonly def
> -         PDFDEBUG {
> -           (.processToUnicode beg) =
> -         } if
> --        2 index /ToUnicode knownoget {
> --          dup type /dicttype eq { dup /File known not } { //true }
> ifelse {
> --            % We undefine wrong /Length and define /File in stream
> dictionaries.
> --            % Bug687351.pdf defines /ToUnicode /Identity-H, what is
> incorrect.
> --            (   **** Warning: Ignoring bad ToUnicode CMap.\n)
> pdfformatwarning
> --            pop
> -+
> -+        2 index /ToUnicode knownoget
> -+        {
> -+            dup type /nametype eq {
> -+              % This is contrary to the specification but it seems that
> Acrobat at least will accept
> -+              % a ToUnicode with a value of Identity-H *and* will use
> that for search, copy/paste.
> -+              % We can't pass through a name, so the best we can do is
> build a GlyphNames2Unicode
> -+              % map matching that which would have been generated by a
> full 16-bit Identity CMap
> -+              %
> -+              % See bug numbers 701003 and 687351
> -+              %
> -+              dup /Identity-H eq 1 index /Identity-V eq or{
> -+                pop
> -+                1 index /FontInfo .knownget not {
> -+                  currentglobal 2 index dup gcheck setglobal
> -+                  /FontInfo 5 dict dup 5 1 roll .forceput
> -+                  setglobal
> -+                } if
> -+                dup /GlyphNames2Unicode .knownget not {
> -+                  //true                        % No existing G2U, make
> one
> -+                } {
> -+                  dup wcheck {
> -+                    //false                     % Existing, writeable
> G2U, don't make new one
> -+                  } {
> -+                    pop //true                          % Existing read
> only G2U, make new one
> -+                  } ifelse
> -+                } ifelse
> -+                {
> -+                  currentglobal exch dup gcheck setglobal
> -+                  dup /GlyphNames2Unicode 100 dict dup 4 1 roll .forceput
> -+                  3 2 roll setglobal
> -+                } if                                 % font-res
> font-dict encoding|null font-info g2u
> -+
> -+                0 1 65535{
> -+                                                        % g2u index
> -+                  dup dup 256 mod exch 256 idiv         % g2u index
> lo-byte hi-byte
> -+                  2 string dup 0 4 -1 roll              % g2u index
> lo-byte () () 0 hi-byte
> -+                  put                                   % g2u index
> lo-byte (x)
> -+                  dup 1                                 % g2u index
> lo-byte (x) (x) 1
> -+                  4 -1 roll put                         % g2u index (x)
> (x) 1 lo-byte -> dict index (xx)
> -+                  2 index                               % g2u index (xx)
> dict
> -+                  3 1 roll                              % g2u g2u index
> (xx)
> -+                  put                                   % g2u
> -+                } for
> -+                pop                                     % font-res
> font-dict encoding|null font-info
> -+                pop                                     % font-res
> font-dict encoding|null
> -+                //false                                 % We built a
> GlyphNames2Unicode table, don't need to process further
> -+              }{
> -+                //true                                  % name is not
> Identity-V or H, fail by falling through
> -+              }ifelse
> -           } {
> --            /PDFScanRules .getuserparam dup //null eq {
> --              pop //PDFScanRules_null
> --            } {
> --              1 dict dup /PDFScanRules 4 -1 roll put
> --            } ifelse
> --            //PDFScanRules_true setuserparams
> --            PDFfile fileposition
> --            3 -1 roll
> --            count 1 sub
> --            countdictstack
> --            { //false resolvestream
> --              % Following Acrobat we ignore everything outside
> --              %   begincodespacerange .. endcmap.
> --              dup 0 (begincodespacerange) /SubFileDecode filter flushfile
> --              /CIDInit /ProcSet findresource begin
> --              //ToUnicodeCMapReader begin
> --              12 dict begin
> --              /CMapType 2 def
> --              mark exch % emulate 'begincodespacerange'
> --              0 (endcmap) /SubFileDecode filter cvx /begincmap cvx exch
> 2 .execn
> --              endcmap
> --              userdict /.lastToUnicode currentdict put
> --              end end end
> --            }
> -+            //true
> -+          } ifelse                                      % not a name,
> try as a dictionary (as specified)
> -
> --            PDFSTOPONERROR {
> --              { exec } 0 get
> --              //false
> --              5 -2 roll
> --              5
> -+          % If the ToUnicode isn't a name, or the name isn't Identity-V
> or -H then follow the specification
> -+          % If its not a dictionary type throw an error, otherwise
> decode it and build a GlyphNames2Unicode
> -+          %
> -+          {
> -+            dup type /dicttype eq { dup /File known not } { //true }
> ifelse {
> -+              % We undefine wrong /Length and define /File in stream
> dictionaries.
> -+              % Bug687351.pdf defines /ToUnicode /Identity-H, what is
> incorrect.
> -+              (   **** Warning: Ignoring bad ToUnicode CMap.\n)
> pdfformatwarning
> -+              pop
> -             } {
> --              { stopped } 0 get
> --              4 2 roll
> --              4
> --            } ifelse
> --            array astore cvx exec
> -+              /PDFScanRules .getuserparam dup //null eq {
> -+                pop //PDFScanRules_null
> -+              } {
> -+                1 dict dup /PDFScanRules 4 -1 roll put
> -+              } ifelse
> -+              //PDFScanRules_true setuserparams
> -+              PDFfile fileposition
> -+              3 -1 roll
> -+              count 1 sub
> -+              countdictstack
> -+              { //false resolvestream
> -+                % Following Acrobat we ignore everything outside
> -+                %   begincodespacerange .. endcmap.
> -+                dup 0 (begincodespacerange) /SubFileDecode filter
> flushfile
> -+                /CIDInit /ProcSet findresource begin
> -+                //ToUnicodeCMapReader begin
> -+                12 dict begin
> -+                /CMapType 2 def
> -+                mark exch % emulate 'begincodespacerange'
> -+                0 (endcmap) /SubFileDecode filter cvx /begincmap cvx
> exch 2 .execn
> -+                endcmap
> -+                userdict /.lastToUnicode currentdict put
> -+                end end end
> -+              }
> -
> --            countdictstack exch sub 0 .max { end } repeat
> --            count exch sub 2 sub 0 .max { exch pop } repeat
> --            3 1 roll                     % Stach the stop flag.
> --            PDFfile exch setfileposition
> --            setuserparams
> --            {
> --              (   **** Warning: Failed to read ToUnicode CMap.\n)
> pdfformatwarning
> --            } {
> --              1 index /FontInfo .knownget not {
> --                currentglobal 2 index dup gcheck setglobal
> --                /FontInfo 5 dict dup 5 1 roll .forceput
> --                setglobal
> --              } if
> --              dup /GlyphNames2Unicode .knownget not {
> --                //true                        % No existing G2U, make one
> -+              PDFSTOPONERROR {
> -+                { exec } 0 get
> -+                //false
> -+                5 -2 roll
> -+                5
> -+              } {
> -+                { stopped } 0 get
> -+                4 2 roll
> -+                4
> -+              } ifelse
> -+              array astore cvx exec
> -+
> -+              countdictstack exch sub 0 .max { end } repeat
> -+              count exch sub 2 sub 0 .max { exch pop } repeat
> -+              3 1 roll                     % Stach the stop flag.
> -+              PDFfile exch setfileposition
> -+              setuserparams
> -+              {
> -+                (   **** Warning: Failed to read ToUnicode CMap.\n)
> pdfformatwarning
> -               } {
> --                dup wcheck {
> --                  //false                     % Existing, writeable G2U,
> don't make new one
> -+                1 index /FontInfo .knownget not {
> -+                  currentglobal 2 index dup gcheck setglobal
> -+                  /FontInfo 5 dict dup 5 1 roll .forceput
> -+                  setglobal
> -+                } if
> -+                dup /GlyphNames2Unicode .knownget not {
> -+                  //true                        % No existing G2U, make
> one
> -                 } {
> --                  pop //true                          % Existing read
> only G2U, make new one
> -+                  dup wcheck {
> -+                    //false                     % Existing, writeable
> G2U, don't make new one
> -+                  } {
> -+                    pop //true                          % Existing read
> only G2U, make new one
> -+                  } ifelse
> -                 } ifelse
> -+                {
> -+                  currentglobal exch dup gcheck setglobal
> -+                  dup /GlyphNames2Unicode 100 dict dup 4 1 roll .forceput
> -+                  3 2 roll setglobal
> -+                } if                                 % font-res
> font-dict encoding|null font-info g2u
> -+                exch pop exch                        % font-res
> font-dict g2u encoding|null
> -+                userdict /.lastToUnicode get         % font-res
> font-dict g2u Encoding|null CMap
> -+                .convert_ToUnicode-into-g2u          % font-res font-dict
> -+                //null                               % font-res
> font-dict //null
> -               } ifelse
> --              {
> --                currentglobal exch dup gcheck setglobal
> --                dup /GlyphNames2Unicode 100 dict dup 4 1 roll .forceput
> --                3 2 roll setglobal
> --              } if                                 % font-res font-dict
> encoding|null font-info g2u
> --              exch pop exch                        % font-res font-dict
> g2u encoding|null
> --              userdict /.lastToUnicode get         % font-res font-dict
> g2u Encoding|null CMap
> --              .convert_ToUnicode-into-g2u          % font-res font-dict
> --              //null                               % font-res font-dict
> //null
> -             } ifelse
> --          } ifelse
> --        } if
> --        PDFDEBUG {
> --          (.processToUnicode end) =
> -+          } if
> -+          PDFDEBUG {
> -+            (.processToUnicode end) =
> -+          } if
> -         } if
> -       } if
> -     } stopped
> ---
> -2.20.1
> -
> diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch
> b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch
> deleted file mode 100644
> index 6348fff2d1..0000000000
> ---
> a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch
> +++ /dev/null
> @@ -1,236 +0,0 @@
> -From cd1b1cacadac2479e291efe611979bdc1b3bdb19 Mon Sep 17 00:00:00 2001
> -From: Ken Sharp <ken.sharp@artifex.com>
> -Date: Wed, 21 Aug 2019 10:10:51 +0100
> -Subject: [PATCH 2/2] PDF interpreter - review .forceput security
> -
> -Bug #701450 "Safer Mode Bypass by .forceput Exposure in .pdfexectoken"
> -
> -By abusing the error handler it was possible to get the PDFDEBUG portion
> -of .pdfexectoken, which uses .forceput left readable.
> -
> -Add an executeonly appropriately to make sure that clause isn't readable
> -no mstter what.
> -
> -Review all the uses of .forceput searching for similar cases, add
> -executeonly as required to secure those. All cases in the PostScript
> -support files seem to be covered already.
> -
> -CVE: CVE-2019-14817
> -Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
> -
> -Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> ----
> - Resource/Init/pdf_base.ps |  2 +-
> - Resource/Init/pdf_draw.ps | 14 +++++++-------
> - Resource/Init/pdf_font.ps | 29 ++++++++++++++++-------------
> - Resource/Init/pdf_main.ps |  6 +++---
> - Resource/Init/pdf_ops.ps  | 11 ++++++-----
> - 5 files changed, 33 insertions(+), 29 deletions(-)
> -
> -diff --git a/Resource/Init/pdf_base.ps b/Resource/Init/pdf_base.ps
> -index 1a218f4..cffde5c 100644
> ---- a/Resource/Init/pdf_base.ps
> -+++ b/Resource/Init/pdf_base.ps
> -@@ -157,7 +157,7 @@ currentdict /num-chars-dict .undef
> -     {
> -       dup ==only () = flush
> -     } ifelse % PDFSTEP
> --  } if % PDFDEBUG
> -+  } executeonly if % PDFDEBUG
> -   2 copy .knownget {
> -     exch pop exch pop exch pop exec
> -   } {
> -diff --git a/Resource/Init/pdf_draw.ps b/Resource/Init/pdf_draw.ps
> -index e18a7c2..0a3924c 100644
> ---- a/Resource/Init/pdf_draw.ps
> -+++ b/Resource/Init/pdf_draw.ps
> -@@ -501,8 +501,8 @@ end
> -       (        Output may be incorrect.\n) pdfformaterror
> -       //pdfdict /.gs_warning_issued //true .forceput
> -       PDFSTOPONERROR { /gs /undefined signalerror } if
> --    } if
> --  }
> -+    } executeonly if
> -+  } executeonly
> -   ifelse
> - } bind executeonly def
> -
> -@@ -1142,7 +1142,7 @@ currentdict end readonly def
> -           .setglobal
> -           pdfformaterror
> -         } executeonly ifelse
> --      }
> -+      } executeonly
> -       {
> -         currentglobal //pdfdict gcheck .setglobal
> -         //pdfdict /.Qqwarning_issued //true .forceput
> -@@ -1150,8 +1150,8 @@ currentdict end readonly def
> -         pdfformaterror
> -       } executeonly ifelse
> -       end
> --    } ifelse
> --  } loop
> -+    } executeonly ifelse
> -+  } executeonly loop
> -   {
> -     (\n   **** Error: File has unbalanced q/Q operators \(too many
> q's\)\n               Output may be incorrect.\n)
> -     //pdfdict /.Qqwarning_issued .knownget
> -@@ -1165,14 +1165,14 @@ currentdict end readonly def
> -         .setglobal
> -         pdfformaterror
> -       } executeonly ifelse
> --    }
> -+    } executeonly
> -     {
> -       currentglobal //pdfdict gcheck .setglobal
> -       //pdfdict /.Qqwarning_issued //true .forceput
> -       .setglobal
> -       pdfformaterror
> -     } executeonly ifelse
> --  } if
> -+  } executeonly if
> -   pop
> -
> -   % restore pdfemptycount
> -diff --git a/Resource/Init/pdf_font.ps b/Resource/Init/pdf_font.ps
> -index 2df3303..6a6a5fe 100644
> ---- a/Resource/Init/pdf_font.ps
> -+++ b/Resource/Init/pdf_font.ps
> -@@ -638,7 +638,7 @@ currentdict end readonly def
> -                   currentglobal 2 index dup gcheck setglobal
> -                   /FontInfo 5 dict dup 5 1 roll .forceput
> -                   setglobal
> --                } if
> -+                } executeonly if
> -                 dup /GlyphNames2Unicode .knownget not {
> -                   //true                        % No existing G2U, make
> one
> -                 } {
> -@@ -668,10 +668,12 @@ currentdict end readonly def
> -                 pop                                     % font-res
> font-dict encoding|null font-info
> -                 pop                                     % font-res
> font-dict encoding|null
> -                 //false                                 % We built a
> GlyphNames2Unicode table, don't need to process further
> --              }{
> -+              } executeonly
> -+              {
> -                 //true                                  % name is not
> Identity-V or H, fail by falling through
> -               }ifelse
> --          } {
> -+          } executeonly
> -+          {
> -             //true
> -           } ifelse                                      % not a name,
> try as a dictionary (as specified)
> -
> -@@ -759,9 +761,9 @@ currentdict end readonly def
> -           PDFDEBUG {
> -             (.processToUnicode end) =
> -           } if
> --        } if
> --      } if
> --    } stopped
> -+        } executeonly if
> -+      } executeonly if
> -+    } executeonly stopped
> -     {
> -       .dstackdepth 1 countdictstack 1 sub
> -       {pop end} for
> -@@ -1291,19 +1293,20 @@ currentdict /eexec_pdf_param_dict .undef
> -                 //pdfdict /.Qqwarning_issued //true .forceput
> -               } executeonly if
> -               Q
> --            } repeat
> -+            } executeonly repeat
> -             Q
> --          } PDFfile fileposition 2 .execn % Keep pdfcount valid.
> -+          } executeonly PDFfile fileposition 2 .execn % Keep pdfcount
> valid.
> -           PDFfile exch setfileposition
> --        } ifelse
> --      } {
> -+        } executeonly ifelse
> -+      } executeonly
> -+      {
> -         % PDF Type 3 fonts don't use .notdef
> -         % d1 implementation adjusts the width as needed
> -         0 0 0 0 0 0
> -         pdfopdict /d1 get exec
> -       } ifelse
> -       end end
> --    } bdef
> -+    } executeonly bdef
> -     dup currentdict Encoding .processToUnicode
> -     currentdict end .completefont exch pop
> - } bind executeonly odef
> -@@ -2103,9 +2106,9 @@ currentdict /CMap_read_dict undef
> -           (Will continue, but content may be missing.) = flush
> -         } ifelse
> -       } if
> --    } if
> -+    } executeonly if
> -     /findresource cvx /undefined signalerror
> --  } loop
> -+  } executeonly loop
> - } bind executeonly odef
> -
> - /buildCIDType0 {      % <CIDFontType0-font-resource> buildCIDType0 <font>
> -diff --git a/Resource/Init/pdf_main.ps b/Resource/Init/pdf_main.ps
> -index 5305ea6..a59e63c 100644
> ---- a/Resource/Init/pdf_main.ps
> -+++ b/Resource/Init/pdf_main.ps
> -@@ -2749,15 +2749,15 @@ currentdict /PDF2PS_matrix_key undef
> -           .setglobal
> -           pdfformaterror
> -         } executeonly ifelse
> --      }
> -+      } executeonly
> -       {
> -         currentglobal //pdfdict gcheck .setglobal
> -         //pdfdict /.Qqwarning_issued //true .forceput
> -         .setglobal
> -         pdfformaterror
> -       } executeonly ifelse
> --    } if
> --  } if
> -+    } executeonly if
> -+  } executeonly if
> -   pop
> -   count PDFexecstackcount sub { pop } repeat
> -   (after exec) VMDEBUG
> -diff --git a/Resource/Init/pdf_ops.ps b/Resource/Init/pdf_ops.ps
> -index 285e582..6c1f100 100644
> ---- a/Resource/Init/pdf_ops.ps
> -+++ b/Resource/Init/pdf_ops.ps
> -@@ -186,14 +186,14 @@ currentdict /gput_always_allow .undef
> -         .setglobal
> -         pdfformaterror
> -       } executeonly ifelse
> --    }
> -+    } executeonly
> -     {
> -       currentglobal //pdfdict gcheck .setglobal
> -       //pdfdict /.Qqwarning_issued //true .forceput
> -       .setglobal
> -       pdfformaterror
> -     } executeonly ifelse
> --  } if
> -+  } executeonly if
> - } bind executeonly odef
> -
> - % Save PDF gstate
> -@@ -440,11 +440,12 @@ currentdict /gput_always_allow .undef
> -   dup type /booleantype eq {
> -     .currentSMask type /dicttype eq {
> -       .currentSMask /Processed 2 index .forceput
> -+    } executeonly
> -+    {
> -+      .setSMask
> -+    }ifelse
> -   } executeonly
> -   {
> --      .setSMask
> --  }ifelse
> --  }{
> -   .setSMask
> -   }ifelse
> -
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
> b/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
> similarity index 92%
> rename from meta/recipes-extended/ghostscript/ghostscript_9.27.bb
> rename to meta/recipes-extended/ghostscript/ghostscript_9.50.bb
> index 32f938f254..39c32644db 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
> @@ -19,15 +19,12 @@ DEPENDS_class-native = "libpng-native"
>  UPSTREAM_CHECK_URI = "
> https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
>
> -SRC_URI_BASE = "
> https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927/${BPN}-${PV}.tar.gz
> \
> +SRC_URI_BASE = "
> https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs950/${BPN}-${PV}.tar.gz
> \
>                  file://ghostscript-9.15-parallel-make.patch \
>                  file://ghostscript-9.16-Werror-return-type.patch \
>                  file://do-not-check-local-libpng-source.patch \
>                  file://avoid-host-contamination.patch \
>                  file://mkdir-p.patch \
> -                file://CVE-2019-14811-0001.patch \
> -                file://CVE-2019-14817-0001.patch \
> -                file://CVE-2019-14817-0002.patch \
>                  file://CVE-2019-14869-0001.patch \
>  "
>
> @@ -43,8 +40,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
>
>  file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
>                          "
>
> -SRC_URI[md5sum] = "c3990a504a3a23b9babe9de00ed6597d"
> -SRC_URI[sha256sum] =
> "9760e8bdd07a08dbd445188a6557cb70e60ccb6a5601f7dbfba0d225e28ce285"
> +SRC_URI[md5sum] = "00970cf622bd5b46f68eec9383753870"
> +SRC_URI[sha256sum] =
> "0f53e89fd647815828fc5171613e860e8535b68f7afbc91bf89aee886769ce89"
>
>  # Put something like
>  #
> --
> 2.24.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002708d505990ede28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">If the fix for 2019-14869 is included in =
9.50, why the patch for it is not removed?</div><div dir=3D"ltr"><br></div>=
<div>Alex<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, 6 Dec 2019 at 21:09, Trevor Gamblin &lt;<a href=3D"mai=
lto:Trevor.Gamblin@windriver.com">Trevor.Gamblin@windriver.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Trevor =
Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.com" target=3D"_blan=
k">trevor.gamblin@windriver.com</a>&gt;<br>
<br>
Version 9.50 incorporates a fix for CVE-2019-14869 as well as<br>
previously-backported fixes for CVE-2019-14811 and CVE-2019-14817.<br>
<br>
CVE: CVE-2019-14869<br>
CVE: CVE-2019-14811<br>
CVE: CVE-2019-14817<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windrive=
r.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../ghostscript/CVE-2019-14811-0001.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
69 -----<br>
=C2=A0.../ghostscript/CVE-2019-14817-0001.patch=C2=A0 =C2=A0 =C2=A0| 270 --=
----------------<br>
=C2=A0.../ghostscript/CVE-2019-14817-0002.patch=C2=A0 =C2=A0 =C2=A0| 236 --=
-------------<br>
=C2=A0...<a href=3D"http://hostscript_9.27.bb" rel=3D"noreferrer" target=3D=
"_blank">hostscript_9.27.bb</a> =3D&gt; <a href=3D"http://ghostscript_9.50.=
bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.50.bb</a>} |=C2=A0 =
=C2=A09 +-<br>
=C2=A04 files changed, 3 insertions(+), 581 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-=
2019-14811-0001.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-=
2019-14817-0001.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-=
2019-14817-0002.patch<br>
=C2=A0rename meta/recipes-extended/ghostscript/{<a href=3D"http://ghostscri=
pt_9.27.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.27.bb</a> =
=3D&gt; <a href=3D"http://ghostscript_9.50.bb" rel=3D"noreferrer" target=3D=
"_blank">ghostscript_9.50.bb</a>} (92%)<br>
<br>
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0=
001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-00=
01.patch<br>
deleted file mode 100644<br>
index d4ef0996ec..0000000000<br>
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.pat=
ch<br>
+++ /dev/null<br>
@@ -1,69 +0,0 @@<br>
-From 885444fcbe10dc42787ecb76686c8ee4dd33bf33 Mon Sep 17 00:00:00 2001<br>
-From: Ken Sharp &lt;<a href=3D"mailto:ken.sharp@artifex.com" target=3D"_bl=
ank">ken.sharp@artifex.com</a>&gt;<br>
-Date: Tue, 20 Aug 2019 10:10:28 +0100<br>
-Subject: [PATCH] make .forceput inaccessible<br>
-<br>
-Bug #701343, #701344, #701345<br>
-<br>
-More defensive programming. We don&#39;t want people to access .forecput<b=
r>
-even though it is no longer sufficient to bypass SAFER. The exploit<br>
-in #701343 didn&#39;t work anyway because of earlier work to stop the erro=
r<br>
-handler being used, but nevertheless, prevent access to .forceput from<br>
-.setuserparams2.<br>
-<br>
-CVE: CVE-2019-14811<br>
-CVE: CVE-2019-14813<br>
-Upstream-Status: Backport [git://<a href=3D"http://git.ghostscript.com/gho=
stpdl.git" rel=3D"noreferrer" target=3D"_blank">git.ghostscript.com/ghostpd=
l.git</a>]<br>
-<br>
-Signed-off-by: Stefan Ghinea &lt;<a href=3D"mailto:stefan.ghinea@windriver=
.com" target=3D"_blank">stefan.ghinea@windriver.com</a>&gt;<br>
----<br>
- Resource/Init/<a href=3D"http://gs_lev2.ps" rel=3D"noreferrer" target=3D"=
_blank">gs_lev2.ps</a>=C2=A0 | 6 +++---<br>
- Resource/Init/<a href=3D"http://gs_pdfwr.ps" rel=3D"noreferrer" target=3D=
"_blank">gs_pdfwr.ps</a> | 4 ++--<br>
- 2 files changed, 5 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/Resource/Init/<a href=3D"http://gs_lev2.ps" rel=3D"noreferrer=
" target=3D"_blank">gs_lev2.ps</a> b/Resource/Init/<a href=3D"http://gs_lev=
2.ps" rel=3D"noreferrer" target=3D"_blank">gs_lev2.ps</a><br>
-index 98d55fe..f1b771f 100644<br>
---- a/Resource/Init/<a href=3D"http://gs_lev2.ps" rel=3D"noreferrer" targe=
t=3D"_blank">gs_lev2.ps</a><br>
-+++ b/Resource/Init/<a href=3D"http://gs_lev2.ps" rel=3D"noreferrer" targe=
t=3D"_blank">gs_lev2.ps</a><br>
-@@ -158,7 +158,7 @@ end<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pop pop<br>
-=C2=A0 =C2=A0 =C2=A0} ifelse<br>
--=C2=A0 } forall<br>
-+=C2=A0 } executeonly forall<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% A context switch might have occurred d=
uring the above loop,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% causing the interpreter-level paramete=
rs to be reset.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% Set them again to the new values.=C2=
=A0 From here on, we are safe,<br>
-@@ -229,9 +229,9 @@ end<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { pop pop<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ifelse<br>
--=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 } executeonly<br>
-=C2=A0 =C2=A0 forall pop<br>
--} .bind odef<br>
-+} .bind executeonly odef<br>
- <br>
- % Initialize the passwords.<br>
- % NOTE: the names StartJobPassword and SystemParamsPassword are known to<=
br>
-diff --git a/Resource/Init/<a href=3D"http://gs_pdfwr.ps" rel=3D"noreferre=
r" target=3D"_blank">gs_pdfwr.ps</a> b/Resource/Init/<a href=3D"http://gs_p=
dfwr.ps" rel=3D"noreferrer" target=3D"_blank">gs_pdfwr.ps</a><br>
-index 00c19fa..dfe504d 100644<br>
---- a/Resource/Init/<a href=3D"http://gs_pdfwr.ps" rel=3D"noreferrer" targ=
et=3D"_blank">gs_pdfwr.ps</a><br>
-+++ b/Resource/Init/<a href=3D"http://gs_pdfwr.ps" rel=3D"noreferrer" targ=
et=3D"_blank">gs_pdfwr.ps</a><br>
-@@ -652,11 +652,11 @@ currentdict /.pdfmarkparams .undef<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemdict /.pdf_hooked_DSC_Creat=
or //true .forceput<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} executeonly if<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pop<br>
--=C2=A0 =C2=A0 =C2=A0 } if<br>
-+=C2=A0 =C2=A0 =C2=A0 } executeonly if<br>
-=C2=A0 =C2=A0 =C2=A0} {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pop<br>
-=C2=A0 =C2=A0 =C2=A0} ifelse<br>
--=C2=A0 }<br>
-+=C2=A0 } executeonly<br>
-=C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0pop<br>
-=C2=A0 =C2=A0} ifelse<br>
--- <br>
-2.20.1<br>
-<br>
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0=
001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-00=
01.patch<br>
deleted file mode 100644<br>
index c76e21caa6..0000000000<br>
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.pat=
ch<br>
+++ /dev/null<br>
@@ -1,270 +0,0 @@<br>
-From 0bafbd9c1273fab0dc79fd20db0ffc4443683f96 Mon Sep 17 00:00:00 2001<br>
-From: Ken Sharp &lt;<a href=3D"mailto:ken.sharp@artifex.com" target=3D"_bl=
ank">ken.sharp@artifex.com</a>&gt;<br>
-Date: Mon, 29 Apr 2019 11:14:06 +0100<br>
-Subject: [PATCH 1/2] PDF interpreter - Decode ToUnicode entries of the for=
m<br>
- /Identity-H/V<br>
-<br>
-Bug #701003 &quot;Text searchability broken due to omission of /ToUnicode =
/Identity-H&quot;<br>
-<br>
-The PDF references from 1.2 too 2.0 all state that the value associated<br=
>
-with a ToUnicode key in a FontDescriptor must be a stream object. However<=
br>
-this file (and one case seen previously, bug 687351) have FontDescriptor<b=
r>
-dictionaries where the value associated with a /ToUnicode key is a<br>
-name object, in both cases /Identity-H.<br>
-<br>
-Although this is clearly not legal, Acrobat not only tolerates it, it<br>
-actually uses it for search/copy/paste (see bug 701003 for details).<br>
-Without the key Acrobat is unable to successfully search the output file.<=
br>
-<br>
-We can&#39;t simply preserve the name object as a ToUnicode value; when<br=
>
-handling ToUnicode we actually decode the CMap and build a<br>
-GlyphNames2Unicode map (an internal representation of the G2U data<br>
-produced by the Microsoft PostScript printer driver). When writing the<br>
-output file we use that information to get a Unicode value for each<br>
-character we write, and build a new ToUnicode CMap using that.<br>
-<br>
-This commit tackles the problem by pre-scanning for a name object and<br>
-then checking to see if its Identity-H or Identity-V (although we have<br>
-not seen an Identity-V, there seems no reason why it wouldn&#39;t be<br>
-equally valid). If we find either of these then we construct a<br>
-GlyphNames2Unicode table for all possible values (0 - 65535) and store<br>
-that with the font as normal. When we write the output file we only<br>
-write the required entries for the subset font, so we write a now<br>
-completely legal ToUnicode CMap, and Acrobat is equally happy with that<br=
>
-as the original name.<br>
-<br>
-If the ToUnicode value isn&#39;t a name object, or isn&#39;t one of the<br=
>
-identities then we proceed as before. This means we will print a<br>
-warning for non conforming ToUnicode entries and ignore them.<br>
-<br>
-CVE: CVE-2019-14817<br>
-Upstream-Status: Backport [git://<a href=3D"http://git.ghostscript.com/gho=
stpdl.git" rel=3D"noreferrer" target=3D"_blank">git.ghostscript.com/ghostpd=
l.git</a>]<br>
-<br>
-Signed-off-by: Stefan Ghinea &lt;<a href=3D"mailto:stefan.ghinea@windriver=
.com" target=3D"_blank">stefan.ghinea@windriver.com</a>&gt;<br>
----<br>
- Resource/Init/<a href=3D"http://pdf_font.ps" rel=3D"noreferrer" target=3D=
"_blank">pdf_font.ps</a> | 200 ++++++++++++++++++++++++--------------<br>
- 1 file changed, 129 insertions(+), 71 deletions(-)<br>
-<br>
-diff --git a/Resource/Init/<a href=3D"http://pdf_font.ps" rel=3D"noreferre=
r" target=3D"_blank">pdf_font.ps</a> b/Resource/Init/<a href=3D"http://pdf_=
font.ps" rel=3D"noreferrer" target=3D"_blank">pdf_font.ps</a><br>
-index 9fb85f6..2df3303 100644<br>
---- a/Resource/Init/<a href=3D"http://pdf_font.ps" rel=3D"noreferrer" targ=
et=3D"_blank">pdf_font.ps</a><br>
-+++ b/Resource/Init/<a href=3D"http://pdf_font.ps" rel=3D"noreferrer" targ=
et=3D"_blank">pdf_font.ps</a><br>
-@@ -621,86 +621,144 @@ currentdict end readonly def<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PDFDEBUG {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(.processToUnicode beg) =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} if<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 2 index /ToUnicode knownoget {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup type /dicttype eq { dup /File know=
n not } { //true } ifelse {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % We undefine wrong /Length and=
 define /File in stream dictionaries.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % Bug687351.pdf defines /ToUnic=
ode /Identity-H, what is incorrect.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=C2=A0 =C2=A0**** Warning: Ign=
oring bad ToUnicode CMap.\n)=C2=A0 pdfformatwarning<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 2 index /ToUnicode knownoget<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup type /nametype eq {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % This is contrary to th=
e specification but it seems that Acrobat at least will accept<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % a ToUnicode with a val=
ue of Identity-H *and* will use that for search, copy/paste.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % We can&#39;t pass thro=
ugh a name, so the best we can do is build a GlyphNames2Unicode<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % map matching that whic=
h would have been generated by a full 16-bit Identity CMap<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % See bug numbers 701003=
 and 687351<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup /Identity-H eq 1 ind=
ex /Identity-V eq or{<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 index /FontInfo=
 .knownget not {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currentglo=
bal 2 index dup gcheck setglobal<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /FontInfo =
5 dict dup 5 1 roll .forceput<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setglobal<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } if<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup /GlyphNames2U=
nicode .knownget not {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //true=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 % No existing G2U, make one<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup wcheck=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //f=
alse=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0% Existing, writeable G2U, don&#39;t make new one<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=
 //true=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 % Existing read only G2U, make new one<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } ifelse<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } ifelse<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currentglo=
bal exch dup gcheck setglobal<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup /Glyph=
Names2Unicode 100 dict dup 4 1 roll .forceput<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 2 roll s=
etglobal<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } if=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% font-res font-dict encoding|null font-info=
 g2u<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 1 65535{<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % g2u index<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup dup 25=
6 mod exch 256 idiv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% g2u index lo-byte hi=
-byte<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 string d=
up 0 4 -1 roll=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % g2u index =
lo-byte () () 0 hi-byte<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 put=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% g2u index lo-byte (x)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup 1=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% g2u index lo-byte (x) (x) 1<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4 -1 roll =
put=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0% g2u index (x) (x) 1 lo-byte -&gt; dict index (xx)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 index=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% g2u index (xx) dict<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 1 roll=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % g2u g2u index (xx)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 put=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% g2u<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } for<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% font-res font-dict encoding|=
null font-info<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% font-res font-dict encoding|=
null<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //false=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% We built a GlyphNames2Unicode table, do=
n&#39;t need to process further<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }{<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //true=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % name is not Identity-V or H, fail by f=
alling through<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }ifelse<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /PDFScanRules .getuserparam dup=
 //null eq {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop //PDFScanRules_null<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 dict dup /PDFScanRules=
 4 -1 roll put<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } ifelse<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //PDFScanRules_true setuserpara=
ms<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PDFfile fileposition<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 -1 roll<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count 1 sub<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 countdictstack<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { //false resolvestream<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % Following Acrobat we i=
gnore everything outside<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %=C2=A0 =C2=A0begincodes=
pacerange .. endcmap.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup 0 (begincodespaceran=
ge) /SubFileDecode filter flushfile<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /CIDInit /ProcSet findre=
source begin<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //ToUnicodeCMapReader be=
gin<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12 dict begin<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /CMapType 2 def<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mark exch % emulate &#39=
;begincodespacerange&#39;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 (endcmap) /SubFileDeco=
de filter cvx /begincmap cvx exch 2 .execn<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endcmap<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 userdict /.lastToUnicode=
 currentdict put<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end end end<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //true<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } ifelse=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % not a name, try as a dictionary (as speci=
fied)<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PDFSTOPONERROR {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { exec } 0 get<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //false<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5 -2 roll<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % If the ToUnicode isn&#39;t a name, o=
r the name isn&#39;t Identity-V or -H then follow the specification<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % If its not a dictionary type throw a=
n error, otherwise decode it and build a GlyphNames2Unicode<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup type /dicttype eq { dup /Fi=
le known not } { //true } ifelse {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % We undefine wrong /Len=
gth and define /File in stream dictionaries.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % Bug687351.pdf defines =
/ToUnicode /Identity-H, what is incorrect.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=C2=A0 =C2=A0**** Warni=
ng: Ignoring bad ToUnicode CMap.\n)=C2=A0 pdfformatwarning<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { stopped } 0 get<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4 2 roll<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } ifelse<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 array astore cvx exec<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /PDFScanRules .getuserpa=
ram dup //null eq {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop //PDFScanRule=
s_null<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 dict dup /PDFSc=
anRules 4 -1 roll put<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } ifelse<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //PDFScanRules_true setu=
serparams<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PDFfile fileposition<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 -1 roll<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count 1 sub<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 countdictstack<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { //false resolvestream<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % Following Acrob=
at we ignore everything outside<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %=C2=A0 =C2=A0beg=
incodespacerange .. endcmap.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup 0 (begincodes=
pacerange) /SubFileDecode filter flushfile<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /CIDInit /ProcSet=
 findresource begin<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //ToUnicodeCMapRe=
ader begin<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12 dict begin<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /CMapType 2 def<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mark exch % emula=
te &#39;begincodespacerange&#39;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 (endcmap) /SubF=
ileDecode filter cvx /begincmap cvx exch 2 .execn<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endcmap<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 userdict /.lastTo=
Unicode currentdict put<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end end end<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 countdictstack exch sub 0 .max =
{ end } repeat<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count exch sub 2 sub 0 .max { e=
xch pop } repeat<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 1 roll=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% Stach the stop fla=
g.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PDFfile exch setfileposition<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setuserparams<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=C2=A0 =C2=A0**** Warni=
ng: Failed to read ToUnicode CMap.\n)=C2=A0 pdfformatwarning<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 index /FontInfo .known=
get not {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currentglobal 2 i=
ndex dup gcheck setglobal<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /FontInfo 5 dict =
dup 5 1 roll .forceput<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setglobal<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } if<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup /GlyphNames2Unicode =
.knownget not {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //true=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %=
 No existing G2U, make one<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PDFSTOPONERROR {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { exec } 0 get<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //false<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5 -2 roll<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { stopped } 0 get=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4 2 roll<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } ifelse<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 array astore cvx exec<br=
>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 countdictstack exch sub =
0 .max { end } repeat<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count exch sub 2 sub 0 .=
max { exch pop } repeat<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 1 roll=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% Stach the s=
top flag.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PDFfile exch setfileposi=
tion<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setuserparams<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=C2=A0 =C2=A0***=
* Warning: Failed to read ToUnicode CMap.\n)=C2=A0 pdfformatwarning<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup wcheck {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //false=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% =
Existing, writeable G2U, don&#39;t make new one<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 index /FontInfo=
 .knownget not {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currentglo=
bal 2 index dup gcheck setglobal<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /FontInfo =
5 dict dup 5 1 roll .forceput<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setglobal<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } if<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup /GlyphNames2U=
nicode .knownget not {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //true=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 % No existing G2U, make one<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop //true=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 % Existing read only G2U, make new one<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup wcheck=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //f=
alse=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0% Existing, writeable G2U, don&#39;t make new one<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=
 //true=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 % Existing read only G2U, make new one<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } ifelse<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} ifelse<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currentglo=
bal exch dup gcheck setglobal<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup /Glyph=
Names2Unicode 100 dict dup 4 1 roll .forceput<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 2 roll s=
etglobal<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } if=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% font-res font-dict encoding|null font-info=
 g2u<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exch pop exch=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 % font-res font-dict g2u encoding|null<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 userdict /.lastTo=
Unicode get=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% font-res font-dict g2u Encod=
ing|null CMap<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .convert_ToUnicod=
e-into-g2u=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % font-res font-dict<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //null=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0% font-res font-dict //null<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} ifelse<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currentglobal exc=
h dup gcheck setglobal<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dup /GlyphNames2U=
nicode 100 dict dup 4 1 roll .forceput<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 2 roll setgloba=
l<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } if=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0% font-res font-dict encoding|null font-info g2u<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exch pop exch=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %=
 font-res font-dict g2u encoding|null<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 userdict /.lastToUnicode=
 get=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% font-res font-dict g2u Encoding|nul=
l CMap<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .convert_ToUnicode-into-=
g2u=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % font-res font-dict<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //null=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0% font-res font-dict //null<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} ifelse<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } ifelse<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 } if<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 PDFDEBUG {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (.processToUnicode end) =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } if<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PDFDEBUG {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (.processToUnicode end) =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } if<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} if<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} if<br>
-=C2=A0 =C2=A0 =C2=A0} stopped<br>
--- <br>
-2.20.1<br>
-<br>
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0=
002.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-00=
02.patch<br>
deleted file mode 100644<br>
index 6348fff2d1..0000000000<br>
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.pat=
ch<br>
+++ /dev/null<br>
@@ -1,236 +0,0 @@<br>
-From cd1b1cacadac2479e291efe611979bdc1b3bdb19 Mon Sep 17 00:00:00 2001<br>
-From: Ken Sharp &lt;<a href=3D"mailto:ken.sharp@artifex.com" target=3D"_bl=
ank">ken.sharp@artifex.com</a>&gt;<br>
-Date: Wed, 21 Aug 2019 10:10:51 +0100<br>
-Subject: [PATCH 2/2] PDF interpreter - review .forceput security<br>
-<br>
-Bug #701450 &quot;Safer Mode Bypass by .forceput Exposure in .pdfexectoken=
&quot;<br>
-<br>
-By abusing the error handler it was possible to get the PDFDEBUG portion<b=
r>
-of .pdfexectoken, which uses .forceput left readable.<br>
-<br>
-Add an executeonly appropriately to make sure that clause isn&#39;t readab=
le<br>
-no mstter what.<br>
-<br>
-Review all the uses of .forceput searching for similar cases, add<br>
-executeonly as required to secure those. All cases in the PostScript<br>
-support files seem to be covered already.<br>
-<br>
-CVE: CVE-2019-14817<br>
-Upstream-Status: Backport [git://<a href=3D"http://git.ghostscript.com/gho=
stpdl.git" rel=3D"noreferrer" target=3D"_blank">git.ghostscript.com/ghostpd=
l.git</a>]<br>
-<br>
-Signed-off-by: Stefan Ghinea &lt;<a href=3D"mailto:stefan.ghinea@windriver=
.com" target=3D"_blank">stefan.ghinea@windriver.com</a>&gt;<br>
----<br>
- Resource/Init/<a href=3D"http://pdf_base.ps" rel=3D"noreferrer" target=3D=
"_blank">pdf_base.ps</a> |=C2=A0 2 +-<br>
- Resource/Init/<a href=3D"http://pdf_draw.ps" rel=3D"noreferrer" target=3D=
"_blank">pdf_draw.ps</a> | 14 +++++++-------<br>
- Resource/Init/<a href=3D"http://pdf_font.ps" rel=3D"noreferrer" target=3D=
"_blank">pdf_font.ps</a> | 29 ++++++++++++++++-------------<br>
- Resource/Init/<a href=3D"http://pdf_main.ps" rel=3D"noreferrer" target=3D=
"_blank">pdf_main.ps</a> |=C2=A0 6 +++---<br>
- Resource/Init/<a href=3D"http://pdf_ops.ps" rel=3D"noreferrer" target=3D"=
_blank">pdf_ops.ps</a>=C2=A0 | 11 ++++++-----<br>
- 5 files changed, 33 insertions(+), 29 deletions(-)<br>
-<br>
-diff --git a/Resource/Init/<a href=3D"http://pdf_base.ps" rel=3D"noreferre=
r" target=3D"_blank">pdf_base.ps</a> b/Resource/Init/<a href=3D"http://pdf_=
base.ps" rel=3D"noreferrer" target=3D"_blank">pdf_base.ps</a><br>
-index 1a218f4..cffde5c 100644<br>
---- a/Resource/Init/<a href=3D"http://pdf_base.ps" rel=3D"noreferrer" targ=
et=3D"_blank">pdf_base.ps</a><br>
-+++ b/Resource/Init/<a href=3D"http://pdf_base.ps" rel=3D"noreferrer" targ=
et=3D"_blank">pdf_base.ps</a><br>
-@@ -157,7 +157,7 @@ currentdict /num-chars-dict .undef<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dup =3D=3Donly () =3D flush<br>
-=C2=A0 =C2=A0 =C2=A0} ifelse % PDFSTEP<br>
--=C2=A0 } if % PDFDEBUG<br>
-+=C2=A0 } executeonly if % PDFDEBUG<br>
-=C2=A0 =C2=A02 copy .knownget {<br>
-=C2=A0 =C2=A0 =C2=A0exch pop exch pop exch pop exec<br>
-=C2=A0 =C2=A0} {<br>
-diff --git a/Resource/Init/<a href=3D"http://pdf_draw.ps" rel=3D"noreferre=
r" target=3D"_blank">pdf_draw.ps</a> b/Resource/Init/<a href=3D"http://pdf_=
draw.ps" rel=3D"noreferrer" target=3D"_blank">pdf_draw.ps</a><br>
-index e18a7c2..0a3924c 100644<br>
---- a/Resource/Init/<a href=3D"http://pdf_draw.ps" rel=3D"noreferrer" targ=
et=3D"_blank">pdf_draw.ps</a><br>
-+++ b/Resource/Init/<a href=3D"http://pdf_draw.ps" rel=3D"noreferrer" targ=
et=3D"_blank">pdf_draw.ps</a><br>
-@@ -501,8 +501,8 @@ end<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(=C2=A0 =C2=A0 =C2=A0 =C2=A0 Output may be inco=
rrect.\n) pdfformaterror<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//pdfdict /.gs_warning_issued //true .forceput<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PDFSTOPONERROR { /gs /undefined signalerror } i=
f<br>
--=C2=A0 =C2=A0 } if<br>
--=C2=A0 }<br>
-+=C2=A0 =C2=A0 } executeonly if<br>
-+=C2=A0 } executeonly<br>
-=C2=A0 =C2=A0ifelse<br>
- } bind executeonly def<br>
- <br>
-@@ -1142,7 +1142,7 @@ currentdict end readonly def<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.setglobal<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdfformaterror<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} executeonly ifelse<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 } executeonly<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0currentglobal //pdfdict gcheck .setgloba=
l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//pdfdict /.Qqwarning_issued //true .for=
ceput<br>
-@@ -1150,8 +1150,8 @@ currentdict end readonly def<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdfformaterror<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} executeonly ifelse<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0end<br>
--=C2=A0 =C2=A0 } ifelse<br>
--=C2=A0 } loop<br>
-+=C2=A0 =C2=A0 } executeonly ifelse<br>
-+=C2=A0 } executeonly loop<br>
-=C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0(\n=C2=A0 =C2=A0**** Error: File has unbalanced q/Q op=
erators \(too many q&#39;s\)\n=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Output may be incorrect.\n)<br>
-=C2=A0 =C2=A0 =C2=A0//pdfdict /.Qqwarning_issued .knownget<br>
-@@ -1165,14 +1165,14 @@ currentdict end readonly def<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.setglobal<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdfformaterror<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} executeonly ifelse<br>
--=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 } executeonly<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0currentglobal //pdfdict gcheck .setglobal<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//pdfdict /.Qqwarning_issued //true .forceput<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.setglobal<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pdfformaterror<br>
-=C2=A0 =C2=A0 =C2=A0} executeonly ifelse<br>
--=C2=A0 } if<br>
-+=C2=A0 } executeonly if<br>
-=C2=A0 =C2=A0pop<br>
- <br>
-=C2=A0 =C2=A0% restore pdfemptycount<br>
-diff --git a/Resource/Init/<a href=3D"http://pdf_font.ps" rel=3D"noreferre=
r" target=3D"_blank">pdf_font.ps</a> b/Resource/Init/<a href=3D"http://pdf_=
font.ps" rel=3D"noreferrer" target=3D"_blank">pdf_font.ps</a><br>
-index 2df3303..6a6a5fe 100644<br>
---- a/Resource/Init/<a href=3D"http://pdf_font.ps" rel=3D"noreferrer" targ=
et=3D"_blank">pdf_font.ps</a><br>
-+++ b/Resource/Init/<a href=3D"http://pdf_font.ps" rel=3D"noreferrer" targ=
et=3D"_blank">pdf_font.ps</a><br>
-@@ -638,7 +638,7 @@ currentdict end readonly def<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curre=
ntglobal 2 index dup gcheck setglobal<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/Font=
Info 5 dict dup 5 1 roll .forceput<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setgl=
obal<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } if<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } executeonly if<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dup /GlyphNa=
mes2Unicode .knownget not {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//tru=
e=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 % No existing G2U, make one<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} {<br>
-@@ -668,10 +668,12 @@ currentdict end readonly def<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pop=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% font-res font-dict en=
coding|null font-info<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pop=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% font-res font-dict en=
coding|null<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//false=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% We built a GlyphNames2Unicode ta=
ble, don&#39;t need to process further<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }{<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } executeonly<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//true=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % name is not Identity-V or H, fail =
by falling through<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}ifelse<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } executeonly<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//true<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} ifelse=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % not a name, try as a dictionary (as sp=
ecified)<br>
- <br>
-@@ -759,9 +761,9 @@ currentdict end readonly def<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PDFDEBUG {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(.processToUnicode end) =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} if<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 } if<br>
--=C2=A0 =C2=A0 =C2=A0 } if<br>
--=C2=A0 =C2=A0 } stopped<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } executeonly if<br>
-+=C2=A0 =C2=A0 =C2=A0 } executeonly if<br>
-+=C2=A0 =C2=A0 } executeonly stopped<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.dstackdepth 1 countdictstack 1 sub<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{pop end} for<br>
-@@ -1291,19 +1293,20 @@ currentdict /eexec_pdf_param_dict .undef<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//pdfdict /.=
Qqwarning_issued //true .forceput<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} executeonly if<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Q<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } repeat<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } executeonly repeat<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Q<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } PDFfile fileposition 2 .execn % Keep=
 pdfcount valid.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } executeonly PDFfile fileposition 2 .=
execn % Keep pdfcount valid.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PDFfile exch setfileposition<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 } ifelse<br>
--=C2=A0 =C2=A0 =C2=A0 } {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } executeonly ifelse<br>
-+=C2=A0 =C2=A0 =C2=A0 } executeonly<br>
-+=C2=A0 =C2=A0 =C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% PDF Type 3 fonts don&#39;t use .notdef=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% d1 implementation adjusts the width as=
 needed<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 0 0 0 0 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdfopdict /d1 get exec<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} ifelse<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0end end<br>
--=C2=A0 =C2=A0 } bdef<br>
-+=C2=A0 =C2=A0 } executeonly bdef<br>
-=C2=A0 =C2=A0 =C2=A0dup currentdict Encoding .processToUnicode<br>
-=C2=A0 =C2=A0 =C2=A0currentdict end .completefont exch pop<br>
- } bind executeonly odef<br>
-@@ -2103,9 +2106,9 @@ currentdict /CMap_read_dict undef<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(Will continue, but content may b=
e missing.) =3D flush<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} ifelse<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} if<br>
--=C2=A0 =C2=A0 } if<br>
-+=C2=A0 =C2=A0 } executeonly if<br>
-=C2=A0 =C2=A0 =C2=A0/findresource cvx /undefined signalerror<br>
--=C2=A0 } loop<br>
-+=C2=A0 } executeonly loop<br>
- } bind executeonly odef<br>
- <br>
- /buildCIDType0 {=C2=A0 =C2=A0 =C2=A0 % &lt;CIDFontType0-font-resource&gt;=
 buildCIDType0 &lt;font&gt;<br>
-diff --git a/Resource/Init/<a href=3D"http://pdf_main.ps" rel=3D"noreferre=
r" target=3D"_blank">pdf_main.ps</a> b/Resource/Init/<a href=3D"http://pdf_=
main.ps" rel=3D"noreferrer" target=3D"_blank">pdf_main.ps</a><br>
-index 5305ea6..a59e63c 100644<br>
---- a/Resource/Init/<a href=3D"http://pdf_main.ps" rel=3D"noreferrer" targ=
et=3D"_blank">pdf_main.ps</a><br>
-+++ b/Resource/Init/<a href=3D"http://pdf_main.ps" rel=3D"noreferrer" targ=
et=3D"_blank">pdf_main.ps</a><br>
-@@ -2749,15 +2749,15 @@ currentdict /PDF2PS_matrix_key undef<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.setglobal<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdfformaterror<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} executeonly ifelse<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 } executeonly<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0currentglobal //pdfdict gcheck .setgloba=
l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//pdfdict /.Qqwarning_issued //true .for=
ceput<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.setglobal<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdfformaterror<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} executeonly ifelse<br>
--=C2=A0 =C2=A0 } if<br>
--=C2=A0 } if<br>
-+=C2=A0 =C2=A0 } executeonly if<br>
-+=C2=A0 } executeonly if<br>
-=C2=A0 =C2=A0pop<br>
-=C2=A0 =C2=A0count PDFexecstackcount sub { pop } repeat<br>
-=C2=A0 =C2=A0(after exec) VMDEBUG<br>
-diff --git a/Resource/Init/<a href=3D"http://pdf_ops.ps" rel=3D"noreferrer=
" target=3D"_blank">pdf_ops.ps</a> b/Resource/Init/<a href=3D"http://pdf_op=
s.ps" rel=3D"noreferrer" target=3D"_blank">pdf_ops.ps</a><br>
-index 285e582..6c1f100 100644<br>
---- a/Resource/Init/<a href=3D"http://pdf_ops.ps" rel=3D"noreferrer" targe=
t=3D"_blank">pdf_ops.ps</a><br>
-+++ b/Resource/Init/<a href=3D"http://pdf_ops.ps" rel=3D"noreferrer" targe=
t=3D"_blank">pdf_ops.ps</a><br>
-@@ -186,14 +186,14 @@ currentdict /gput_always_allow .undef<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.setglobal<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdfformaterror<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} executeonly ifelse<br>
--=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 } executeonly<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0currentglobal //pdfdict gcheck .setglobal<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//pdfdict /.Qqwarning_issued //true .forceput<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.setglobal<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pdfformaterror<br>
-=C2=A0 =C2=A0 =C2=A0} executeonly ifelse<br>
--=C2=A0 } if<br>
-+=C2=A0 } executeonly if<br>
- } bind executeonly odef<br>
- <br>
- % Save PDF gstate<br>
-@@ -440,11 +440,12 @@ currentdict /gput_always_allow .undef<br>
-=C2=A0 =C2=A0dup type /booleantype eq {<br>
-=C2=A0 =C2=A0 =C2=A0.currentSMask type /dicttype eq {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.currentSMask /Processed 2 index .forceput<br>
-+=C2=A0 =C2=A0 } executeonly<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 .setSMask<br>
-+=C2=A0 =C2=A0 }ifelse<br>
-=C2=A0 =C2=A0} executeonly<br>
-=C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 .setSMask<br>
--=C2=A0 }ifelse<br>
--=C2=A0 }{<br>
-=C2=A0 =C2=A0.setSMask<br>
-=C2=A0 =C2=A0}ifelse<br>
- <br>
--- <br>
-2.20.1<br>
-<br>
diff --git a/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscrip=
t_9.27.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.27.bb</a> b/m=
eta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_9.50.bb" rel=
=3D"noreferrer" target=3D"_blank">ghostscript_9.50.bb</a><br>
similarity index 92%<br>
rename from meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript=
_9.27.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.27.bb</a><br>
rename to meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_9=
.50.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.50.bb</a><br>
index 32f938f254..39c32644db 100644<br>
--- a/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_9.27.=
bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.27.bb</a><br>
+++ b/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_9.50.=
bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.50.bb</a><br>
@@ -19,15 +19,12 @@ DEPENDS_class-native =3D &quot;libpng-native&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/ArtifexSof=
tware/ghostpdl-downloads/releases" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/ArtifexSoftware/ghostpdl-downloads/releases</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quot;=
<br>
<br>
-SRC_URI_BASE =3D &quot;<a href=3D"https://github.com/ArtifexSoftware/ghost=
pdl-downloads/releases/download/gs927/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/ArtifexSoftware/ghostpdl-do=
wnloads/releases/download/gs927/${BPN}-${PV}.tar.gz</a> \<br>
+SRC_URI_BASE =3D &quot;<a href=3D"https://github.com/ArtifexSoftware/ghost=
pdl-downloads/releases/download/gs950/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/ArtifexSoftware/ghostpdl-do=
wnloads/releases/download/gs950/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ghosts=
cript-9.15-parallel-make.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ghosts=
cript-9.16-Werror-return-type.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://do-not=
-check-local-libpng-source.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://avoid-=
host-contamination.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mkdir-=
p.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2019-14=
811-0001.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2019-14=
817-0001.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2019-14=
817-0002.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-20=
19-14869-0001.patch \<br>
=C2=A0&quot;<br>
<br>
@@ -43,8 +40,8 @@ SRC_URI_class-native =3D &quot;${SRC_URI_BASE} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0file://base-genht.c-add-a-preprocessor-define-to-allow-fop=
e.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;c3990a504a3a23b9babe9de00ed6597d&quot;<br>
-SRC_URI[sha256sum] =3D &quot;9760e8bdd07a08dbd445188a6557cb70e60ccb6a5601f=
7dbfba0d225e28ce285&quot;<br>
+SRC_URI[md5sum] =3D &quot;00970cf622bd5b46f68eec9383753870&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0f53e89fd647815828fc5171613e860e8535b68f7afbc=
91bf89aee886769ce89&quot;<br>
<br>
=C2=A0# Put something like<br>
=C2=A0#<br>
-- <br>
2.24.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000002708d505990ede28--
