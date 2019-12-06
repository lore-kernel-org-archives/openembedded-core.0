Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C42B7FA2C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 20:38:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xB6Kcl2m025186
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 6 Dec 2019 12:38:47 -0800 (PST)
Received: from [128.224.56.222] (128.224.56.222) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 6 Dec 2019 12:38:47 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20191206200915.25807-1-Trevor.Gamblin@windriver.com>
	<CANNYZj8jpj43pexxPrnt81rTHEdB6w6BSL2ve_ront2RFFHNNw@mail.gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <e4b8509c-1d0c-e703-8a5b-c2c37c69b003@windriver.com>
Date: Fri, 6 Dec 2019 15:38:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CANNYZj8jpj43pexxPrnt81rTHEdB6w6BSL2ve_ront2RFFHNNw@mail.gmail.com>
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
X-List-Received-Date: Fri, 06 Dec 2019 20:38:48 -0000
Content-Type: multipart/alternative;
	boundary="------------849EBDF5032257A0581C03AC"
Content-Language: en-US

--------------849EBDF5032257A0581C03AC
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 12/6/19 3:26 PM, Alexander Kanavin wrote:

> If the fix for 2019-14869 is included in 9.50, why the patch for it is 
> not removed?
My mistake - CVE-2019-14869 should still be there, I just wrote the 
commit message incorrectly. NIST database states that it's fixed in 
9.50, but the patch is actually after the 9.50 release, so it still 
needs to be there. Sending a v2...
>
> Alex
>
> On Fri, 6 Dec 2019 at 21:09, Trevor Gamblin 
> <Trevor.Gamblin@windriver.com <mailto:Trevor.Gamblin@windriver.com>> 
> wrote:
>
>     From: Trevor Gamblin <trevor.gamblin@windriver.com
>     <mailto:trevor.gamblin@windriver.com>>
>
>     Version 9.50 incorporates a fix for CVE-2019-14869 as well as
>     previously-backported fixes for CVE-2019-14811 and CVE-2019-14817.
>
>     CVE: CVE-2019-14869
>     CVE: CVE-2019-14811
>     CVE: CVE-2019-14817
>
>     Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com
>     <mailto:trevor.gamblin@windriver.com>>
>     ---
>      .../ghostscript/CVE-2019-14811-0001.patch     |  69 -----
>      .../ghostscript/CVE-2019-14817-0001.patch     | 270
>     ------------------
>      .../ghostscript/CVE-2019-14817-0002.patch     | 236 ---------------
>      ...hostscript_9.27.bb <http://hostscript_9.27.bb> =>
>     ghostscript_9.50.bb <http://ghostscript_9.50.bb>} |   9 +-
>      4 files changed, 3 insertions(+), 581 deletions(-)
>      delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
>      delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch
>      delete mode 100644
>     meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch
>      rename meta/recipes-extended/ghostscript/{ghostscript_9.27.bb
>     <http://ghostscript_9.27.bb> => ghostscript_9.50.bb
>     <http://ghostscript_9.50.bb>} (92%)
>
>     diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
>     b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
>     deleted file mode 100644
>     index d4ef0996ec..0000000000
>     ---
>     a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
>     +++ /dev/null
>     @@ -1,69 +0,0 @@
>     -From 885444fcbe10dc42787ecb76686c8ee4dd33bf33 Mon Sep 17 00:00:00
>     2001
>     -From: Ken Sharp <ken.sharp@artifex.com
>     <mailto:ken.sharp@artifex.com>>
>     -Date: Tue, 20 Aug 2019 10:10:28 +0100
>     -Subject: [PATCH] make .forceput inaccessible
>     -
>     -Bug #701343, #701344, #701345
>     -
>     -More defensive programming. We don't want people to access .forecput
>     -even though it is no longer sufficient to bypass SAFER. The exploit
>     -in #701343 didn't work anyway because of earlier work to stop the
>     error
>     -handler being used, but nevertheless, prevent access to .forceput
>     from
>     -.setuserparams2.
>     -
>     -CVE: CVE-2019-14811
>     -CVE: CVE-2019-14813
>     -Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git
>     <http://git.ghostscript.com/ghostpdl.git>]
>     -
>     -Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com
>     <mailto:stefan.ghinea@windriver.com>>
>     ----
>     - Resource/Init/gs_lev2.ps <http://gs_lev2.ps>  | 6 +++---
>     - Resource/Init/gs_pdfwr.ps <http://gs_pdfwr.ps> | 4 ++--
>     - 2 files changed, 5 insertions(+), 5 deletions(-)
>     -
>     -diff --git a/Resource/Init/gs_lev2.ps <http://gs_lev2.ps>
>     b/Resource/Init/gs_lev2.ps <http://gs_lev2.ps>
>     -index 98d55fe..f1b771f 100644
>     ---- a/Resource/Init/gs_lev2.ps <http://gs_lev2.ps>
>     -+++ b/Resource/Init/gs_lev2.ps <http://gs_lev2.ps>
>     -@@ -158,7 +158,7 @@ end
>     -     {
>     -       pop pop
>     -     } ifelse
>     --  } forall
>     -+  } executeonly forall
>     -         % A context switch might have occurred during the above
>     loop,
>     -         % causing the interpreter-level parameters to be reset.
>     -         % Set them again to the new values.  From here on, we
>     are safe,
>     -@@ -229,9 +229,9 @@ end
>     -        { pop pop
>     -        }
>     -       ifelse
>     --    }
>     -+    } executeonly
>     -    forall pop
>     --} .bind odef
>     -+} .bind executeonly odef
>     -
>     - % Initialize the passwords.
>     - % NOTE: the names StartJobPassword and SystemParamsPassword are
>     known to
>     -diff --git a/Resource/Init/gs_pdfwr.ps <http://gs_pdfwr.ps>
>     b/Resource/Init/gs_pdfwr.ps <http://gs_pdfwr.ps>
>     -index 00c19fa..dfe504d 100644
>     ---- a/Resource/Init/gs_pdfwr.ps <http://gs_pdfwr.ps>
>     -+++ b/Resource/Init/gs_pdfwr.ps <http://gs_pdfwr.ps>
>     -@@ -652,11 +652,11 @@ currentdict /.pdfmarkparams .undef
>     -           systemdict /.pdf_hooked_DSC_Creator //true .forceput
>     -         } executeonly if
>     -         pop
>     --      } if
>     -+      } executeonly if
>     -     } {
>     -       pop
>     -     } ifelse
>     --  }
>     -+  } executeonly
>     -   {
>     -     pop
>     -   } ifelse
>     ---
>     -2.20.1
>     -
>     diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch
>     b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch
>     deleted file mode 100644
>     index c76e21caa6..0000000000
>     ---
>     a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch
>     +++ /dev/null
>     @@ -1,270 +0,0 @@
>     -From 0bafbd9c1273fab0dc79fd20db0ffc4443683f96 Mon Sep 17 00:00:00
>     2001
>     -From: Ken Sharp <ken.sharp@artifex.com
>     <mailto:ken.sharp@artifex.com>>
>     -Date: Mon, 29 Apr 2019 11:14:06 +0100
>     -Subject: [PATCH 1/2] PDF interpreter - Decode ToUnicode entries
>     of the form
>     - /Identity-H/V
>     -
>     -Bug #701003 "Text searchability broken due to omission of
>     /ToUnicode /Identity-H"
>     -
>     -The PDF references from 1.2 too 2.0 all state that the value
>     associated
>     -with a ToUnicode key in a FontDescriptor must be a stream object.
>     However
>     -this file (and one case seen previously, bug 687351) have
>     FontDescriptor
>     -dictionaries where the value associated with a /ToUnicode key is a
>     -name object, in both cases /Identity-H.
>     -
>     -Although this is clearly not legal, Acrobat not only tolerates it, it
>     -actually uses it for search/copy/paste (see bug 701003 for details).
>     -Without the key Acrobat is unable to successfully search the
>     output file.
>     -
>     -We can't simply preserve the name object as a ToUnicode value; when
>     -handling ToUnicode we actually decode the CMap and build a
>     -GlyphNames2Unicode map (an internal representation of the G2U data
>     -produced by the Microsoft PostScript printer driver). When
>     writing the
>     -output file we use that information to get a Unicode value for each
>     -character we write, and build a new ToUnicode CMap using that.
>     -
>     -This commit tackles the problem by pre-scanning for a name object and
>     -then checking to see if its Identity-H or Identity-V (although we
>     have
>     -not seen an Identity-V, there seems no reason why it wouldn't be
>     -equally valid). If we find either of these then we construct a
>     -GlyphNames2Unicode table for all possible values (0 - 65535) and
>     store
>     -that with the font as normal. When we write the output file we only
>     -write the required entries for the subset font, so we write a now
>     -completely legal ToUnicode CMap, and Acrobat is equally happy
>     with that
>     -as the original name.
>     -
>     -If the ToUnicode value isn't a name object, or isn't one of the
>     -identities then we proceed as before. This means we will print a
>     -warning for non conforming ToUnicode entries and ignore them.
>     -
>     -CVE: CVE-2019-14817
>     -Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git
>     <http://git.ghostscript.com/ghostpdl.git>]
>     -
>     -Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com
>     <mailto:stefan.ghinea@windriver.com>>
>     ----
>     - Resource/Init/pdf_font.ps <http://pdf_font.ps> | 200
>     ++++++++++++++++++++++++--------------
>     - 1 file changed, 129 insertions(+), 71 deletions(-)
>     -
>     -diff --git a/Resource/Init/pdf_font.ps <http://pdf_font.ps>
>     b/Resource/Init/pdf_font.ps <http://pdf_font.ps>
>     -index 9fb85f6..2df3303 100644
>     ---- a/Resource/Init/pdf_font.ps <http://pdf_font.ps>
>     -+++ b/Resource/Init/pdf_font.ps <http://pdf_font.ps>
>     -@@ -621,86 +621,144 @@ currentdict end readonly def
>     -         PDFDEBUG {
>     -           (.processToUnicode beg) =
>     -         } if
>     --        2 index /ToUnicode knownoget {
>     --          dup type /dicttype eq { dup /File known not } { //true
>     } ifelse {
>     --            % We undefine wrong /Length and define /File in
>     stream dictionaries.
>     --            % Bug687351.pdf defines /ToUnicode /Identity-H, what
>     is incorrect.
>     --            (   **** Warning: Ignoring bad ToUnicode CMap.\n) 
>     pdfformatwarning
>     --            pop
>     -+
>     -+        2 index /ToUnicode knownoget
>     -+        {
>     -+            dup type /nametype eq {
>     -+              % This is contrary to the specification but it
>     seems that Acrobat at least will accept
>     -+              % a ToUnicode with a value of Identity-H *and*
>     will use that for search, copy/paste.
>     -+              % We can't pass through a name, so the best we can
>     do is build a GlyphNames2Unicode
>     -+              % map matching that which would have been
>     generated by a full 16-bit Identity CMap
>     -+              %
>     -+              % See bug numbers 701003 and 687351
>     -+              %
>     -+              dup /Identity-H eq 1 index /Identity-V eq or{
>     -+                pop
>     -+                1 index /FontInfo .knownget not {
>     -+                  currentglobal 2 index dup gcheck setglobal
>     -+                  /FontInfo 5 dict dup 5 1 roll .forceput
>     -+                  setglobal
>     -+                } if
>     -+                dup /GlyphNames2Unicode .knownget not {
>     -+                  //true                        % No existing
>     G2U, make one
>     -+                } {
>     -+                  dup wcheck {
>     -+                    //false                     % Existing,
>     writeable G2U, don't make new one
>     -+                  } {
>     -+                    pop //true                          %
>     Existing read only G2U, make new one
>     -+                  } ifelse
>     -+                } ifelse
>     -+                {
>     -+                  currentglobal exch dup gcheck setglobal
>     -+                  dup /GlyphNames2Unicode 100 dict dup 4 1 roll
>     .forceput
>     -+                  3 2 roll setglobal
>     -+                } if                                 % font-res
>     font-dict encoding|null font-info g2u
>     -+
>     -+                0 1 65535{
>     -+                                                        % g2u index
>     -+                  dup dup 256 mod exch 256 idiv         % g2u
>     index lo-byte hi-byte
>     -+                  2 string dup 0 4 -1 roll              % g2u
>     index lo-byte () () 0 hi-byte
>     -+                  put                                   % g2u
>     index lo-byte (x)
>     -+                  dup 1                                 % g2u
>     index lo-byte (x) (x) 1
>     -+                  4 -1 roll put                         % g2u
>     index (x) (x) 1 lo-byte -> dict index (xx)
>     -+                  2 index                               % g2u
>     index (xx) dict
>     -+                  3 1 roll                              % g2u
>     g2u index (xx)
>     -+                  put                                   % g2u
>     -+                } for
>     -+                pop                                     %
>     font-res font-dict encoding|null font-info
>     -+                pop                                     %
>     font-res font-dict encoding|null
>     -+                //false                                 % We
>     built a GlyphNames2Unicode table, don't need to process further
>     -+              }{
>     -+                //true                                  % name
>     is not Identity-V or H, fail by falling through
>     -+              }ifelse
>     -           } {
>     --            /PDFScanRules .getuserparam dup //null eq {
>     --              pop //PDFScanRules_null
>     --            } {
>     --              1 dict dup /PDFScanRules 4 -1 roll put
>     --            } ifelse
>     --            //PDFScanRules_true setuserparams
>     --            PDFfile fileposition
>     --            3 -1 roll
>     --            count 1 sub
>     --            countdictstack
>     --            { //false resolvestream
>     --              % Following Acrobat we ignore everything outside
>     --              %   begincodespacerange .. endcmap.
>     --              dup 0 (begincodespacerange) /SubFileDecode filter
>     flushfile
>     --              /CIDInit /ProcSet findresource begin
>     --              //ToUnicodeCMapReader begin
>     --              12 dict begin
>     --              /CMapType 2 def
>     --              mark exch % emulate 'begincodespacerange'
>     --              0 (endcmap) /SubFileDecode filter cvx /begincmap
>     cvx exch 2 .execn
>     --              endcmap
>     --              userdict /.lastToUnicode currentdict put
>     --              end end end
>     --            }
>     -+            //true
>     -+          } ifelse                                      % not a
>     name, try as a dictionary (as specified)
>     -
>     --            PDFSTOPONERROR {
>     --              { exec } 0 get
>     --              //false
>     --              5 -2 roll
>     --              5
>     -+          % If the ToUnicode isn't a name, or the name isn't
>     Identity-V or -H then follow the specification
>     -+          % If its not a dictionary type throw an error,
>     otherwise decode it and build a GlyphNames2Unicode
>     -+          %
>     -+          {
>     -+            dup type /dicttype eq { dup /File known not } {
>     //true } ifelse {
>     -+              % We undefine wrong /Length and define /File in
>     stream dictionaries.
>     -+              % Bug687351.pdf defines /ToUnicode /Identity-H,
>     what is incorrect.
>     -+              (   **** Warning: Ignoring bad ToUnicode CMap.\n) 
>     pdfformatwarning
>     -+              pop
>     -             } {
>     --              { stopped } 0 get
>     --              4 2 roll
>     --              4
>     --            } ifelse
>     --            array astore cvx exec
>     -+              /PDFScanRules .getuserparam dup //null eq {
>     -+                pop //PDFScanRules_null
>     -+              } {
>     -+                1 dict dup /PDFScanRules 4 -1 roll put
>     -+              } ifelse
>     -+              //PDFScanRules_true setuserparams
>     -+              PDFfile fileposition
>     -+              3 -1 roll
>     -+              count 1 sub
>     -+              countdictstack
>     -+              { //false resolvestream
>     -+                % Following Acrobat we ignore everything outside
>     -+                %   begincodespacerange .. endcmap.
>     -+                dup 0 (begincodespacerange) /SubFileDecode
>     filter flushfile
>     -+                /CIDInit /ProcSet findresource begin
>     -+                //ToUnicodeCMapReader begin
>     -+                12 dict begin
>     -+                /CMapType 2 def
>     -+                mark exch % emulate 'begincodespacerange'
>     -+                0 (endcmap) /SubFileDecode filter cvx /begincmap
>     cvx exch 2 .execn
>     -+                endcmap
>     -+                userdict /.lastToUnicode currentdict put
>     -+                end end end
>     -+              }
>     -
>     --            countdictstack exch sub 0 .max { end } repeat
>     --            count exch sub 2 sub 0 .max { exch pop } repeat
>     --            3 1 roll                     % Stach the stop flag.
>     --            PDFfile exch setfileposition
>     --            setuserparams
>     --            {
>     --              (   **** Warning: Failed to read ToUnicode
>     CMap.\n)  pdfformatwarning
>     --            } {
>     --              1 index /FontInfo .knownget not {
>     --                currentglobal 2 index dup gcheck setglobal
>     --                /FontInfo 5 dict dup 5 1 roll .forceput
>     --                setglobal
>     --              } if
>     --              dup /GlyphNames2Unicode .knownget not {
>     --                //true                        % No existing G2U,
>     make one
>     -+              PDFSTOPONERROR {
>     -+                { exec } 0 get
>     -+                //false
>     -+                5 -2 roll
>     -+                5
>     -+              } {
>     -+                { stopped } 0 get
>     -+                4 2 roll
>     -+                4
>     -+              } ifelse
>     -+              array astore cvx exec
>     -+
>     -+              countdictstack exch sub 0 .max { end } repeat
>     -+              count exch sub 2 sub 0 .max { exch pop } repeat
>     -+              3 1 roll                     % Stach the stop flag.
>     -+              PDFfile exch setfileposition
>     -+              setuserparams
>     -+              {
>     -+                (   **** Warning: Failed to read ToUnicode
>     CMap.\n)  pdfformatwarning
>     -               } {
>     --                dup wcheck {
>     --                  //false                     % Existing,
>     writeable G2U, don't make new one
>     -+                1 index /FontInfo .knownget not {
>     -+                  currentglobal 2 index dup gcheck setglobal
>     -+                  /FontInfo 5 dict dup 5 1 roll .forceput
>     -+                  setglobal
>     -+                } if
>     -+                dup /GlyphNames2Unicode .knownget not {
>     -+                  //true                        % No existing
>     G2U, make one
>     -                 } {
>     --                  pop //true                          % Existing
>     read only G2U, make new one
>     -+                  dup wcheck {
>     -+                    //false                     % Existing,
>     writeable G2U, don't make new one
>     -+                  } {
>     -+                    pop //true                          %
>     Existing read only G2U, make new one
>     -+                  } ifelse
>     -                 } ifelse
>     -+                {
>     -+                  currentglobal exch dup gcheck setglobal
>     -+                  dup /GlyphNames2Unicode 100 dict dup 4 1 roll
>     .forceput
>     -+                  3 2 roll setglobal
>     -+                } if                                 % font-res
>     font-dict encoding|null font-info g2u
>     -+                exch pop exch                        % font-res
>     font-dict g2u encoding|null
>     -+                userdict /.lastToUnicode get         % font-res
>     font-dict g2u Encoding|null CMap
>     -+                .convert_ToUnicode-into-g2u          % font-res
>     font-dict
>     -+                //null                               % font-res
>     font-dict //null
>     -               } ifelse
>     --              {
>     --                currentglobal exch dup gcheck setglobal
>     --                dup /GlyphNames2Unicode 100 dict dup 4 1 roll
>     .forceput
>     --                3 2 roll setglobal
>     --              } if                                 % font-res
>     font-dict encoding|null font-info g2u
>     --              exch pop exch                        % font-res
>     font-dict g2u encoding|null
>     --              userdict /.lastToUnicode get         % font-res
>     font-dict g2u Encoding|null CMap
>     --              .convert_ToUnicode-into-g2u          % font-res
>     font-dict
>     --              //null                               % font-res
>     font-dict //null
>     -             } ifelse
>     --          } ifelse
>     --        } if
>     --        PDFDEBUG {
>     --          (.processToUnicode end) =
>     -+          } if
>     -+          PDFDEBUG {
>     -+            (.processToUnicode end) =
>     -+          } if
>     -         } if
>     -       } if
>     -     } stopped
>     ---
>     -2.20.1
>     -
>     diff --git
>     a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch
>     b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch
>     deleted file mode 100644
>     index 6348fff2d1..0000000000
>     ---
>     a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch
>     +++ /dev/null
>     @@ -1,236 +0,0 @@
>     -From cd1b1cacadac2479e291efe611979bdc1b3bdb19 Mon Sep 17 00:00:00
>     2001
>     -From: Ken Sharp <ken.sharp@artifex.com
>     <mailto:ken.sharp@artifex.com>>
>     -Date: Wed, 21 Aug 2019 10:10:51 +0100
>     -Subject: [PATCH 2/2] PDF interpreter - review .forceput security
>     -
>     -Bug #701450 "Safer Mode Bypass by .forceput Exposure in
>     .pdfexectoken"
>     -
>     -By abusing the error handler it was possible to get the PDFDEBUG
>     portion
>     -of .pdfexectoken, which uses .forceput left readable.
>     -
>     -Add an executeonly appropriately to make sure that clause isn't
>     readable
>     -no mstter what.
>     -
>     -Review all the uses of .forceput searching for similar cases, add
>     -executeonly as required to secure those. All cases in the PostScript
>     -support files seem to be covered already.
>     -
>     -CVE: CVE-2019-14817
>     -Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git
>     <http://git.ghostscript.com/ghostpdl.git>]
>     -
>     -Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com
>     <mailto:stefan.ghinea@windriver.com>>
>     ----
>     - Resource/Init/pdf_base.ps <http://pdf_base.ps> |  2 +-
>     - Resource/Init/pdf_draw.ps <http://pdf_draw.ps> | 14 +++++++-------
>     - Resource/Init/pdf_font.ps <http://pdf_font.ps> | 29
>     ++++++++++++++++-------------
>     - Resource/Init/pdf_main.ps <http://pdf_main.ps> |  6 +++---
>     - Resource/Init/pdf_ops.ps <http://pdf_ops.ps>  | 11 ++++++-----
>     - 5 files changed, 33 insertions(+), 29 deletions(-)
>     -
>     -diff --git a/Resource/Init/pdf_base.ps <http://pdf_base.ps>
>     b/Resource/Init/pdf_base.ps <http://pdf_base.ps>
>     -index 1a218f4..cffde5c 100644
>     ---- a/Resource/Init/pdf_base.ps <http://pdf_base.ps>
>     -+++ b/Resource/Init/pdf_base.ps <http://pdf_base.ps>
>     -@@ -157,7 +157,7 @@ currentdict /num-chars-dict .undef
>     -     {
>     -       dup ==only () = flush
>     -     } ifelse % PDFSTEP
>     --  } if % PDFDEBUG
>     -+  } executeonly if % PDFDEBUG
>     -   2 copy .knownget {
>     -     exch pop exch pop exch pop exec
>     -   } {
>     -diff --git a/Resource/Init/pdf_draw.ps <http://pdf_draw.ps>
>     b/Resource/Init/pdf_draw.ps <http://pdf_draw.ps>
>     -index e18a7c2..0a3924c 100644
>     ---- a/Resource/Init/pdf_draw.ps <http://pdf_draw.ps>
>     -+++ b/Resource/Init/pdf_draw.ps <http://pdf_draw.ps>
>     -@@ -501,8 +501,8 @@ end
>     -       (        Output may be incorrect.\n) pdfformaterror
>     -       //pdfdict /.gs_warning_issued //true .forceput
>     -       PDFSTOPONERROR { /gs /undefined signalerror } if
>     --    } if
>     --  }
>     -+    } executeonly if
>     -+  } executeonly
>     -   ifelse
>     - } bind executeonly def
>     -
>     -@@ -1142,7 +1142,7 @@ currentdict end readonly def
>     -           .setglobal
>     -           pdfformaterror
>     -         } executeonly ifelse
>     --      }
>     -+      } executeonly
>     -       {
>     -         currentglobal //pdfdict gcheck .setglobal
>     -         //pdfdict /.Qqwarning_issued //true .forceput
>     -@@ -1150,8 +1150,8 @@ currentdict end readonly def
>     -         pdfformaterror
>     -       } executeonly ifelse
>     -       end
>     --    } ifelse
>     --  } loop
>     -+    } executeonly ifelse
>     -+  } executeonly loop
>     -   {
>     -     (\n   **** Error: File has unbalanced q/Q operators \(too
>     many q's\)\n               Output may be incorrect.\n)
>     -     //pdfdict /.Qqwarning_issued .knownget
>     -@@ -1165,14 +1165,14 @@ currentdict end readonly def
>     -         .setglobal
>     -         pdfformaterror
>     -       } executeonly ifelse
>     --    }
>     -+    } executeonly
>     -     {
>     -       currentglobal //pdfdict gcheck .setglobal
>     -       //pdfdict /.Qqwarning_issued //true .forceput
>     -       .setglobal
>     -       pdfformaterror
>     -     } executeonly ifelse
>     --  } if
>     -+  } executeonly if
>     -   pop
>     -
>     -   % restore pdfemptycount
>     -diff --git a/Resource/Init/pdf_font.ps <http://pdf_font.ps>
>     b/Resource/Init/pdf_font.ps <http://pdf_font.ps>
>     -index 2df3303..6a6a5fe 100644
>     ---- a/Resource/Init/pdf_font.ps <http://pdf_font.ps>
>     -+++ b/Resource/Init/pdf_font.ps <http://pdf_font.ps>
>     -@@ -638,7 +638,7 @@ currentdict end readonly def
>     -                   currentglobal 2 index dup gcheck setglobal
>     -                   /FontInfo 5 dict dup 5 1 roll .forceput
>     -                   setglobal
>     --                } if
>     -+                } executeonly if
>     -                 dup /GlyphNames2Unicode .knownget not {
>     -                   //true                        % No existing
>     G2U, make one
>     -                 } {
>     -@@ -668,10 +668,12 @@ currentdict end readonly def
>     -                 pop                                     %
>     font-res font-dict encoding|null font-info
>     -                 pop                                     %
>     font-res font-dict encoding|null
>     -                 //false                                 % We
>     built a GlyphNames2Unicode table, don't need to process further
>     --              }{
>     -+              } executeonly
>     -+              {
>     -                 //true                                  % name
>     is not Identity-V or H, fail by falling through
>     -               }ifelse
>     --          } {
>     -+          } executeonly
>     -+          {
>     -             //true
>     -           } ifelse                                      % not a
>     name, try as a dictionary (as specified)
>     -
>     -@@ -759,9 +761,9 @@ currentdict end readonly def
>     -           PDFDEBUG {
>     -             (.processToUnicode end) =
>     -           } if
>     --        } if
>     --      } if
>     --    } stopped
>     -+        } executeonly if
>     -+      } executeonly if
>     -+    } executeonly stopped
>     -     {
>     -       .dstackdepth 1 countdictstack 1 sub
>     -       {pop end} for
>     -@@ -1291,19 +1293,20 @@ currentdict /eexec_pdf_param_dict .undef
>     -                 //pdfdict /.Qqwarning_issued //true .forceput
>     -               } executeonly if
>     -               Q
>     --            } repeat
>     -+            } executeonly repeat
>     -             Q
>     --          } PDFfile fileposition 2 .execn % Keep pdfcount valid.
>     -+          } executeonly PDFfile fileposition 2 .execn % Keep
>     pdfcount valid.
>     -           PDFfile exch setfileposition
>     --        } ifelse
>     --      } {
>     -+        } executeonly ifelse
>     -+      } executeonly
>     -+      {
>     -         % PDF Type 3 fonts don't use .notdef
>     -         % d1 implementation adjusts the width as needed
>     -         0 0 0 0 0 0
>     -         pdfopdict /d1 get exec
>     -       } ifelse
>     -       end end
>     --    } bdef
>     -+    } executeonly bdef
>     -     dup currentdict Encoding .processToUnicode
>     -     currentdict end .completefont exch pop
>     - } bind executeonly odef
>     -@@ -2103,9 +2106,9 @@ currentdict /CMap_read_dict undef
>     -           (Will continue, but content may be missing.) = flush
>     -         } ifelse
>     -       } if
>     --    } if
>     -+    } executeonly if
>     -     /findresource cvx /undefined signalerror
>     --  } loop
>     -+  } executeonly loop
>     - } bind executeonly odef
>     -
>     - /buildCIDType0 {      % <CIDFontType0-font-resource>
>     buildCIDType0 <font>
>     -diff --git a/Resource/Init/pdf_main.ps <http://pdf_main.ps>
>     b/Resource/Init/pdf_main.ps <http://pdf_main.ps>
>     -index 5305ea6..a59e63c 100644
>     ---- a/Resource/Init/pdf_main.ps <http://pdf_main.ps>
>     -+++ b/Resource/Init/pdf_main.ps <http://pdf_main.ps>
>     -@@ -2749,15 +2749,15 @@ currentdict /PDF2PS_matrix_key undef
>     -           .setglobal
>     -           pdfformaterror
>     -         } executeonly ifelse
>     --      }
>     -+      } executeonly
>     -       {
>     -         currentglobal //pdfdict gcheck .setglobal
>     -         //pdfdict /.Qqwarning_issued //true .forceput
>     -         .setglobal
>     -         pdfformaterror
>     -       } executeonly ifelse
>     --    } if
>     --  } if
>     -+    } executeonly if
>     -+  } executeonly if
>     -   pop
>     -   count PDFexecstackcount sub { pop } repeat
>     -   (after exec) VMDEBUG
>     -diff --git a/Resource/Init/pdf_ops.ps <http://pdf_ops.ps>
>     b/Resource/Init/pdf_ops.ps <http://pdf_ops.ps>
>     -index 285e582..6c1f100 100644
>     ---- a/Resource/Init/pdf_ops.ps <http://pdf_ops.ps>
>     -+++ b/Resource/Init/pdf_ops.ps <http://pdf_ops.ps>
>     -@@ -186,14 +186,14 @@ currentdict /gput_always_allow .undef
>     -         .setglobal
>     -         pdfformaterror
>     -       } executeonly ifelse
>     --    }
>     -+    } executeonly
>     -     {
>     -       currentglobal //pdfdict gcheck .setglobal
>     -       //pdfdict /.Qqwarning_issued //true .forceput
>     -       .setglobal
>     -       pdfformaterror
>     -     } executeonly ifelse
>     --  } if
>     -+  } executeonly if
>     - } bind executeonly odef
>     -
>     - % Save PDF gstate
>     -@@ -440,11 +440,12 @@ currentdict /gput_always_allow .undef
>     -   dup type /booleantype eq {
>     -     .currentSMask type /dicttype eq {
>     -       .currentSMask /Processed 2 index .forceput
>     -+    } executeonly
>     -+    {
>     -+      .setSMask
>     -+    }ifelse
>     -   } executeonly
>     -   {
>     --      .setSMask
>     --  }ifelse
>     --  }{
>     -   .setSMask
>     -   }ifelse
>     -
>     ---
>     -2.20.1
>     -
>     diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
>     <http://ghostscript_9.27.bb>
>     b/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
>     <http://ghostscript_9.50.bb>
>     similarity index 92%
>     rename from meta/recipes-extended/ghostscript/ghostscript_9.27.bb
>     <http://ghostscript_9.27.bb>
>     rename to meta/recipes-extended/ghostscript/ghostscript_9.50.bb
>     <http://ghostscript_9.50.bb>
>     index 32f938f254..39c32644db 100644
>     --- a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
>     <http://ghostscript_9.27.bb>
>     +++ b/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
>     <http://ghostscript_9.50.bb>
>     @@ -19,15 +19,12 @@ DEPENDS_class-native = "libpng-native"
>      UPSTREAM_CHECK_URI =
>     "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
>      UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
>
>     -SRC_URI_BASE =
>     "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927/${BPN}-${PV}.tar.gz
>     <https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927/$%7BBPN%7D-$%7BPV%7D.tar.gz>
>     \
>     +SRC_URI_BASE =
>     "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs950/${BPN}-${PV}.tar.gz
>     <https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs950/$%7BBPN%7D-$%7BPV%7D.tar.gz>
>     \
>                      file://ghostscript-9.15-parallel-make.patch \
>      file://ghostscript-9.16-Werror-return-type.patch \
>      file://do-not-check-local-libpng-source.patch \
>                      file://avoid-host-contamination.patch \
>                      file://mkdir-p.patch \
>     -                file://CVE-2019-14811-0001.patch \
>     -                file://CVE-2019-14817-0001.patch \
>     -                file://CVE-2019-14817-0002.patch \
>                      file://CVE-2019-14869-0001.patch \
>      "
>
>     @@ -43,8 +40,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
>      file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
>                              "
>
>     -SRC_URI[md5sum] = "c3990a504a3a23b9babe9de00ed6597d"
>     -SRC_URI[sha256sum] =
>     "9760e8bdd07a08dbd445188a6557cb70e60ccb6a5601f7dbfba0d225e28ce285"
>     +SRC_URI[md5sum] = "00970cf622bd5b46f68eec9383753870"
>     +SRC_URI[sha256sum] =
>     "0f53e89fd647815828fc5171613e860e8535b68f7afbc91bf89aee886769ce89"
>
>      # Put something like
>      #
>     -- 
>     2.24.0
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--------------849EBDF5032257A0581C03AC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 12/6/19 3:26 PM, Alexander Kanavin wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj8jpj43pexxPrnt81rTHEdB6w6BSL2ve_ront2RFFHNNw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">If the fix for 2019-14869 is included in 9.50,
          why the patch for it is not removed?</div>
      </div>
    </blockquote>
    My mistake - CVE-2019-14869 should still be there, I just wrote the
    commit message incorrectly. NIST database states that it's fixed in
    9.50, but the patch is actually after the 9.50 release, so it still
    needs to be there. Sending a v2...<br>
    <blockquote type="cite"
cite="mid:CANNYZj8jpj43pexxPrnt81rTHEdB6w6BSL2ve_ront2RFFHNNw@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <div>Alex<br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, 6 Dec 2019 at 21:09,
            Trevor Gamblin &lt;<a
              href="mailto:Trevor.Gamblin@windriver.com"
              moz-do-not-send="true">Trevor.Gamblin@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">From: Trevor Gamblin &lt;<a
              href="mailto:trevor.gamblin@windriver.com" target="_blank"
              moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;<br>
            <br>
            Version 9.50 incorporates a fix for CVE-2019-14869 as well
            as<br>
            previously-backported fixes for CVE-2019-14811 and
            CVE-2019-14817.<br>
            <br>
            CVE: CVE-2019-14869<br>
            CVE: CVE-2019-14811<br>
            CVE: CVE-2019-14817<br>
            <br>
            Signed-off-by: Trevor Gamblin &lt;<a
              href="mailto:trevor.gamblin@windriver.com" target="_blank"
              moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;<br>
            ---<br>
             .../ghostscript/CVE-2019-14811-0001.patch     |  69 -----<br>
             .../ghostscript/CVE-2019-14817-0001.patch     | 270
            ------------------<br>
             .../ghostscript/CVE-2019-14817-0002.patch     | 236
            ---------------<br>
             ...<a href="http://hostscript_9.27.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">hostscript_9.27.bb</a>
            =&gt; <a href="http://ghostscript_9.50.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">ghostscript_9.50.bb</a>}
            |   9 +-<br>
             4 files changed, 3 insertions(+), 581 deletions(-)<br>
             delete mode 100644
            meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch<br>
             delete mode 100644
            meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch<br>
             delete mode 100644
            meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch<br>
             rename meta/recipes-extended/ghostscript/{<a
              href="http://ghostscript_9.27.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">ghostscript_9.27.bb</a>
            =&gt; <a href="http://ghostscript_9.50.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">ghostscript_9.50.bb</a>}
            (92%)<br>
            <br>
            diff --git
a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch<br>
            deleted file mode 100644<br>
            index d4ef0996ec..0000000000<br>
            ---
a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch<br>
            +++ /dev/null<br>
            @@ -1,69 +0,0 @@<br>
            -From 885444fcbe10dc42787ecb76686c8ee4dd33bf33 Mon Sep 17
            00:00:00 2001<br>
            -From: Ken Sharp &lt;<a href="mailto:ken.sharp@artifex.com"
              target="_blank" moz-do-not-send="true">ken.sharp@artifex.com</a>&gt;<br>
            -Date: Tue, 20 Aug 2019 10:10:28 +0100<br>
            -Subject: [PATCH] make .forceput inaccessible<br>
            -<br>
            -Bug #701343, #701344, #701345<br>
            -<br>
            -More defensive programming. We don't want people to access
            .forecput<br>
            -even though it is no longer sufficient to bypass SAFER. The
            exploit<br>
            -in #701343 didn't work anyway because of earlier work to
            stop the error<br>
            -handler being used, but nevertheless, prevent access to
            .forceput from<br>
            -.setuserparams2.<br>
            -<br>
            -CVE: CVE-2019-14811<br>
            -CVE: CVE-2019-14813<br>
            -Upstream-Status: Backport [git://<a
              href="http://git.ghostscript.com/ghostpdl.git"
              rel="noreferrer" target="_blank" moz-do-not-send="true">git.ghostscript.com/ghostpdl.git</a>]<br>
            -<br>
            -Signed-off-by: Stefan Ghinea &lt;<a
              href="mailto:stefan.ghinea@windriver.com" target="_blank"
              moz-do-not-send="true">stefan.ghinea@windriver.com</a>&gt;<br>
            ----<br>
            - Resource/Init/<a href="http://gs_lev2.ps" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gs_lev2.ps</a>  | 6
            +++---<br>
            - Resource/Init/<a href="http://gs_pdfwr.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">gs_pdfwr.ps</a>
            | 4 ++--<br>
            - 2 files changed, 5 insertions(+), 5 deletions(-)<br>
            -<br>
            -diff --git a/Resource/Init/<a href="http://gs_lev2.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">gs_lev2.ps</a>
            b/Resource/Init/<a href="http://gs_lev2.ps" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gs_lev2.ps</a><br>
            -index 98d55fe..f1b771f 100644<br>
            ---- a/Resource/Init/<a href="http://gs_lev2.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">gs_lev2.ps</a><br>
            -+++ b/Resource/Init/<a href="http://gs_lev2.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">gs_lev2.ps</a><br>
            -@@ -158,7 +158,7 @@ end<br>
            -     {<br>
            -       pop pop<br>
            -     } ifelse<br>
            --  } forall<br>
            -+  } executeonly forall<br>
            -         % A context switch might have occurred during the
            above loop,<br>
            -         % causing the interpreter-level parameters to be
            reset.<br>
            -         % Set them again to the new values.  From here on,
            we are safe,<br>
            -@@ -229,9 +229,9 @@ end<br>
            -        { pop pop<br>
            -        }<br>
            -       ifelse<br>
            --    }<br>
            -+    } executeonly<br>
            -    forall pop<br>
            --} .bind odef<br>
            -+} .bind executeonly odef<br>
            - <br>
            - % Initialize the passwords.<br>
            - % NOTE: the names StartJobPassword and
            SystemParamsPassword are known to<br>
            -diff --git a/Resource/Init/<a href="http://gs_pdfwr.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">gs_pdfwr.ps</a>
            b/Resource/Init/<a href="http://gs_pdfwr.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">gs_pdfwr.ps</a><br>
            -index 00c19fa..dfe504d 100644<br>
            ---- a/Resource/Init/<a href="http://gs_pdfwr.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">gs_pdfwr.ps</a><br>
            -+++ b/Resource/Init/<a href="http://gs_pdfwr.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">gs_pdfwr.ps</a><br>
            -@@ -652,11 +652,11 @@ currentdict /.pdfmarkparams .undef<br>
            -           systemdict /.pdf_hooked_DSC_Creator //true
            .forceput<br>
            -         } executeonly if<br>
            -         pop<br>
            --      } if<br>
            -+      } executeonly if<br>
            -     } {<br>
            -       pop<br>
            -     } ifelse<br>
            --  }<br>
            -+  } executeonly<br>
            -   {<br>
            -     pop<br>
            -   } ifelse<br>
            --- <br>
            -2.20.1<br>
            -<br>
            diff --git
a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch
b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch<br>
            deleted file mode 100644<br>
            index c76e21caa6..0000000000<br>
            ---
a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0001.patch<br>
            +++ /dev/null<br>
            @@ -1,270 +0,0 @@<br>
            -From 0bafbd9c1273fab0dc79fd20db0ffc4443683f96 Mon Sep 17
            00:00:00 2001<br>
            -From: Ken Sharp &lt;<a href="mailto:ken.sharp@artifex.com"
              target="_blank" moz-do-not-send="true">ken.sharp@artifex.com</a>&gt;<br>
            -Date: Mon, 29 Apr 2019 11:14:06 +0100<br>
            -Subject: [PATCH 1/2] PDF interpreter - Decode ToUnicode
            entries of the form<br>
            - /Identity-H/V<br>
            -<br>
            -Bug #701003 "Text searchability broken due to omission of
            /ToUnicode /Identity-H"<br>
            -<br>
            -The PDF references from 1.2 too 2.0 all state that the
            value associated<br>
            -with a ToUnicode key in a FontDescriptor must be a stream
            object. However<br>
            -this file (and one case seen previously, bug 687351) have
            FontDescriptor<br>
            -dictionaries where the value associated with a /ToUnicode
            key is a<br>
            -name object, in both cases /Identity-H.<br>
            -<br>
            -Although this is clearly not legal, Acrobat not only
            tolerates it, it<br>
            -actually uses it for search/copy/paste (see bug 701003 for
            details).<br>
            -Without the key Acrobat is unable to successfully search
            the output file.<br>
            -<br>
            -We can't simply preserve the name object as a ToUnicode
            value; when<br>
            -handling ToUnicode we actually decode the CMap and build a<br>
            -GlyphNames2Unicode map (an internal representation of the
            G2U data<br>
            -produced by the Microsoft PostScript printer driver). When
            writing the<br>
            -output file we use that information to get a Unicode value
            for each<br>
            -character we write, and build a new ToUnicode CMap using
            that.<br>
            -<br>
            -This commit tackles the problem by pre-scanning for a name
            object and<br>
            -then checking to see if its Identity-H or Identity-V
            (although we have<br>
            -not seen an Identity-V, there seems no reason why it
            wouldn't be<br>
            -equally valid). If we find either of these then we
            construct a<br>
            -GlyphNames2Unicode table for all possible values (0 -
            65535) and store<br>
            -that with the font as normal. When we write the output file
            we only<br>
            -write the required entries for the subset font, so we write
            a now<br>
            -completely legal ToUnicode CMap, and Acrobat is equally
            happy with that<br>
            -as the original name.<br>
            -<br>
            -If the ToUnicode value isn't a name object, or isn't one of
            the<br>
            -identities then we proceed as before. This means we will
            print a<br>
            -warning for non conforming ToUnicode entries and ignore
            them.<br>
            -<br>
            -CVE: CVE-2019-14817<br>
            -Upstream-Status: Backport [git://<a
              href="http://git.ghostscript.com/ghostpdl.git"
              rel="noreferrer" target="_blank" moz-do-not-send="true">git.ghostscript.com/ghostpdl.git</a>]<br>
            -<br>
            -Signed-off-by: Stefan Ghinea &lt;<a
              href="mailto:stefan.ghinea@windriver.com" target="_blank"
              moz-do-not-send="true">stefan.ghinea@windriver.com</a>&gt;<br>
            ----<br>
            - Resource/Init/<a href="http://pdf_font.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_font.ps</a>
            | 200 ++++++++++++++++++++++++--------------<br>
            - 1 file changed, 129 insertions(+), 71 deletions(-)<br>
            -<br>
            -diff --git a/Resource/Init/<a href="http://pdf_font.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_font.ps</a>
            b/Resource/Init/<a href="http://pdf_font.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_font.ps</a><br>
            -index 9fb85f6..2df3303 100644<br>
            ---- a/Resource/Init/<a href="http://pdf_font.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_font.ps</a><br>
            -+++ b/Resource/Init/<a href="http://pdf_font.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_font.ps</a><br>
            -@@ -621,86 +621,144 @@ currentdict end readonly def<br>
            -         PDFDEBUG {<br>
            -           (.processToUnicode beg) =<br>
            -         } if<br>
            --        2 index /ToUnicode knownoget {<br>
            --          dup type /dicttype eq { dup /File known not } {
            //true } ifelse {<br>
            --            % We undefine wrong /Length and define /File
            in stream dictionaries.<br>
            --            % Bug687351.pdf defines /ToUnicode
            /Identity-H, what is incorrect.<br>
            --            (   **** Warning: Ignoring bad ToUnicode
            CMap.\n)  pdfformatwarning<br>
            --            pop<br>
            -+<br>
            -+        2 index /ToUnicode knownoget<br>
            -+        {<br>
            -+            dup type /nametype eq {<br>
            -+              % This is contrary to the specification but
            it seems that Acrobat at least will accept<br>
            -+              % a ToUnicode with a value of Identity-H
            *and* will use that for search, copy/paste.<br>
            -+              % We can't pass through a name, so the best
            we can do is build a GlyphNames2Unicode<br>
            -+              % map matching that which would have been
            generated by a full 16-bit Identity CMap<br>
            -+              %<br>
            -+              % See bug numbers 701003 and 687351<br>
            -+              %<br>
            -+              dup /Identity-H eq 1 index /Identity-V eq
            or{<br>
            -+                pop<br>
            -+                1 index /FontInfo .knownget not {<br>
            -+                  currentglobal 2 index dup gcheck
            setglobal<br>
            -+                  /FontInfo 5 dict dup 5 1 roll .forceput<br>
            -+                  setglobal<br>
            -+                } if<br>
            -+                dup /GlyphNames2Unicode .knownget not {<br>
            -+                  //true                        % No
            existing G2U, make one<br>
            -+                } {<br>
            -+                  dup wcheck {<br>
            -+                    //false                     %
            Existing, writeable G2U, don't make new one<br>
            -+                  } {<br>
            -+                    pop //true                          %
            Existing read only G2U, make new one<br>
            -+                  } ifelse<br>
            -+                } ifelse<br>
            -+                {<br>
            -+                  currentglobal exch dup gcheck setglobal<br>
            -+                  dup /GlyphNames2Unicode 100 dict dup 4 1
            roll .forceput<br>
            -+                  3 2 roll setglobal<br>
            -+                } if                                 %
            font-res font-dict encoding|null font-info g2u<br>
            -+<br>
            -+                0 1 65535{<br>
            -+                                                        %
            g2u index<br>
            -+                  dup dup 256 mod exch 256 idiv         %
            g2u index lo-byte hi-byte<br>
            -+                  2 string dup 0 4 -1 roll              %
            g2u index lo-byte () () 0 hi-byte<br>
            -+                  put                                   %
            g2u index lo-byte (x)<br>
            -+                  dup 1                                 %
            g2u index lo-byte (x) (x) 1<br>
            -+                  4 -1 roll put                         %
            g2u index (x) (x) 1 lo-byte -&gt; dict index (xx)<br>
            -+                  2 index                               %
            g2u index (xx) dict<br>
            -+                  3 1 roll                              %
            g2u g2u index (xx)<br>
            -+                  put                                   %
            g2u<br>
            -+                } for<br>
            -+                pop                                     %
            font-res font-dict encoding|null font-info<br>
            -+                pop                                     %
            font-res font-dict encoding|null<br>
            -+                //false                                 %
            We built a GlyphNames2Unicode table, don't need to process
            further<br>
            -+              }{<br>
            -+                //true                                  %
            name is not Identity-V or H, fail by falling through<br>
            -+              }ifelse<br>
            -           } {<br>
            --            /PDFScanRules .getuserparam dup //null eq {<br>
            --              pop //PDFScanRules_null<br>
            --            } {<br>
            --              1 dict dup /PDFScanRules 4 -1 roll put<br>
            --            } ifelse<br>
            --            //PDFScanRules_true setuserparams<br>
            --            PDFfile fileposition<br>
            --            3 -1 roll<br>
            --            count 1 sub<br>
            --            countdictstack<br>
            --            { //false resolvestream<br>
            --              % Following Acrobat we ignore everything
            outside<br>
            --              %   begincodespacerange .. endcmap.<br>
            --              dup 0 (begincodespacerange) /SubFileDecode
            filter flushfile<br>
            --              /CIDInit /ProcSet findresource begin<br>
            --              //ToUnicodeCMapReader begin<br>
            --              12 dict begin<br>
            --              /CMapType 2 def<br>
            --              mark exch % emulate 'begincodespacerange'<br>
            --              0 (endcmap) /SubFileDecode filter cvx
            /begincmap cvx exch 2 .execn<br>
            --              endcmap<br>
            --              userdict /.lastToUnicode currentdict put<br>
            --              end end end<br>
            --            }<br>
            -+            //true<br>
            -+          } ifelse                                      %
            not a name, try as a dictionary (as specified)<br>
            - <br>
            --            PDFSTOPONERROR {<br>
            --              { exec } 0 get<br>
            --              //false<br>
            --              5 -2 roll<br>
            --              5<br>
            -+          % If the ToUnicode isn't a name, or the name
            isn't Identity-V or -H then follow the specification<br>
            -+          % If its not a dictionary type throw an error,
            otherwise decode it and build a GlyphNames2Unicode<br>
            -+          %<br>
            -+          {<br>
            -+            dup type /dicttype eq { dup /File known not }
            { //true } ifelse {<br>
            -+              % We undefine wrong /Length and define /File
            in stream dictionaries.<br>
            -+              % Bug687351.pdf defines /ToUnicode
            /Identity-H, what is incorrect.<br>
            -+              (   **** Warning: Ignoring bad ToUnicode
            CMap.\n)  pdfformatwarning<br>
            -+              pop<br>
            -             } {<br>
            --              { stopped } 0 get<br>
            --              4 2 roll<br>
            --              4<br>
            --            } ifelse<br>
            --            array astore cvx exec<br>
            -+              /PDFScanRules .getuserparam dup //null eq {<br>
            -+                pop //PDFScanRules_null<br>
            -+              } {<br>
            -+                1 dict dup /PDFScanRules 4 -1 roll put<br>
            -+              } ifelse<br>
            -+              //PDFScanRules_true setuserparams<br>
            -+              PDFfile fileposition<br>
            -+              3 -1 roll<br>
            -+              count 1 sub<br>
            -+              countdictstack<br>
            -+              { //false resolvestream<br>
            -+                % Following Acrobat we ignore everything
            outside<br>
            -+                %   begincodespacerange .. endcmap.<br>
            -+                dup 0 (begincodespacerange) /SubFileDecode
            filter flushfile<br>
            -+                /CIDInit /ProcSet findresource begin<br>
            -+                //ToUnicodeCMapReader begin<br>
            -+                12 dict begin<br>
            -+                /CMapType 2 def<br>
            -+                mark exch % emulate 'begincodespacerange'<br>
            -+                0 (endcmap) /SubFileDecode filter cvx
            /begincmap cvx exch 2 .execn<br>
            -+                endcmap<br>
            -+                userdict /.lastToUnicode currentdict put<br>
            -+                end end end<br>
            -+              }<br>
            - <br>
            --            countdictstack exch sub 0 .max { end } repeat<br>
            --            count exch sub 2 sub 0 .max { exch pop }
            repeat<br>
            --            3 1 roll                     % Stach the stop
            flag.<br>
            --            PDFfile exch setfileposition<br>
            --            setuserparams<br>
            --            {<br>
            --              (   **** Warning: Failed to read ToUnicode
            CMap.\n)  pdfformatwarning<br>
            --            } {<br>
            --              1 index /FontInfo .knownget not {<br>
            --                currentglobal 2 index dup gcheck setglobal<br>
            --                /FontInfo 5 dict dup 5 1 roll .forceput<br>
            --                setglobal<br>
            --              } if<br>
            --              dup /GlyphNames2Unicode .knownget not {<br>
            --                //true                        % No
            existing G2U, make one<br>
            -+              PDFSTOPONERROR {<br>
            -+                { exec } 0 get<br>
            -+                //false<br>
            -+                5 -2 roll<br>
            -+                5<br>
            -+              } {<br>
            -+                { stopped } 0 get<br>
            -+                4 2 roll<br>
            -+                4<br>
            -+              } ifelse<br>
            -+              array astore cvx exec<br>
            -+<br>
            -+              countdictstack exch sub 0 .max { end }
            repeat<br>
            -+              count exch sub 2 sub 0 .max { exch pop }
            repeat<br>
            -+              3 1 roll                     % Stach the
            stop flag.<br>
            -+              PDFfile exch setfileposition<br>
            -+              setuserparams<br>
            -+              {<br>
            -+                (   **** Warning: Failed to read ToUnicode
            CMap.\n)  pdfformatwarning<br>
            -               } {<br>
            --                dup wcheck {<br>
            --                  //false                     % Existing,
            writeable G2U, don't make new one<br>
            -+                1 index /FontInfo .knownget not {<br>
            -+                  currentglobal 2 index dup gcheck
            setglobal<br>
            -+                  /FontInfo 5 dict dup 5 1 roll .forceput<br>
            -+                  setglobal<br>
            -+                } if<br>
            -+                dup /GlyphNames2Unicode .knownget not {<br>
            -+                  //true                        % No
            existing G2U, make one<br>
            -                 } {<br>
            --                  pop //true                          %
            Existing read only G2U, make new one<br>
            -+                  dup wcheck {<br>
            -+                    //false                     %
            Existing, writeable G2U, don't make new one<br>
            -+                  } {<br>
            -+                    pop //true                          %
            Existing read only G2U, make new one<br>
            -+                  } ifelse<br>
            -                 } ifelse<br>
            -+                {<br>
            -+                  currentglobal exch dup gcheck setglobal<br>
            -+                  dup /GlyphNames2Unicode 100 dict dup 4 1
            roll .forceput<br>
            -+                  3 2 roll setglobal<br>
            -+                } if                                 %
            font-res font-dict encoding|null font-info g2u<br>
            -+                exch pop exch                        %
            font-res font-dict g2u encoding|null<br>
            -+                userdict /.lastToUnicode get         %
            font-res font-dict g2u Encoding|null CMap<br>
            -+                .convert_ToUnicode-into-g2u          %
            font-res font-dict<br>
            -+                //null                               %
            font-res font-dict //null<br>
            -               } ifelse<br>
            --              {<br>
            --                currentglobal exch dup gcheck setglobal<br>
            --                dup /GlyphNames2Unicode 100 dict dup 4 1
            roll .forceput<br>
            --                3 2 roll setglobal<br>
            --              } if                                 %
            font-res font-dict encoding|null font-info g2u<br>
            --              exch pop exch                        %
            font-res font-dict g2u encoding|null<br>
            --              userdict /.lastToUnicode get         %
            font-res font-dict g2u Encoding|null CMap<br>
            --              .convert_ToUnicode-into-g2u          %
            font-res font-dict<br>
            --              //null                               %
            font-res font-dict //null<br>
            -             } ifelse<br>
            --          } ifelse<br>
            --        } if<br>
            --        PDFDEBUG {<br>
            --          (.processToUnicode end) =<br>
            -+          } if<br>
            -+          PDFDEBUG {<br>
            -+            (.processToUnicode end) =<br>
            -+          } if<br>
            -         } if<br>
            -       } if<br>
            -     } stopped<br>
            --- <br>
            -2.20.1<br>
            -<br>
            diff --git
a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch
b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch<br>
            deleted file mode 100644<br>
            index 6348fff2d1..0000000000<br>
            ---
a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14817-0002.patch<br>
            +++ /dev/null<br>
            @@ -1,236 +0,0 @@<br>
            -From cd1b1cacadac2479e291efe611979bdc1b3bdb19 Mon Sep 17
            00:00:00 2001<br>
            -From: Ken Sharp &lt;<a href="mailto:ken.sharp@artifex.com"
              target="_blank" moz-do-not-send="true">ken.sharp@artifex.com</a>&gt;<br>
            -Date: Wed, 21 Aug 2019 10:10:51 +0100<br>
            -Subject: [PATCH 2/2] PDF interpreter - review .forceput
            security<br>
            -<br>
            -Bug #701450 "Safer Mode Bypass by .forceput Exposure in
            .pdfexectoken"<br>
            -<br>
            -By abusing the error handler it was possible to get the
            PDFDEBUG portion<br>
            -of .pdfexectoken, which uses .forceput left readable.<br>
            -<br>
            -Add an executeonly appropriately to make sure that clause
            isn't readable<br>
            -no mstter what.<br>
            -<br>
            -Review all the uses of .forceput searching for similar
            cases, add<br>
            -executeonly as required to secure those. All cases in the
            PostScript<br>
            -support files seem to be covered already.<br>
            -<br>
            -CVE: CVE-2019-14817<br>
            -Upstream-Status: Backport [git://<a
              href="http://git.ghostscript.com/ghostpdl.git"
              rel="noreferrer" target="_blank" moz-do-not-send="true">git.ghostscript.com/ghostpdl.git</a>]<br>
            -<br>
            -Signed-off-by: Stefan Ghinea &lt;<a
              href="mailto:stefan.ghinea@windriver.com" target="_blank"
              moz-do-not-send="true">stefan.ghinea@windriver.com</a>&gt;<br>
            ----<br>
            - Resource/Init/<a href="http://pdf_base.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_base.ps</a>
            |  2 +-<br>
            - Resource/Init/<a href="http://pdf_draw.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_draw.ps</a>
            | 14 +++++++-------<br>
            - Resource/Init/<a href="http://pdf_font.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_font.ps</a>
            | 29 ++++++++++++++++-------------<br>
            - Resource/Init/<a href="http://pdf_main.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_main.ps</a>
            |  6 +++---<br>
            - Resource/Init/<a href="http://pdf_ops.ps" rel="noreferrer"
              target="_blank" moz-do-not-send="true">pdf_ops.ps</a>  |
            11 ++++++-----<br>
            - 5 files changed, 33 insertions(+), 29 deletions(-)<br>
            -<br>
            -diff --git a/Resource/Init/<a href="http://pdf_base.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_base.ps</a>
            b/Resource/Init/<a href="http://pdf_base.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_base.ps</a><br>
            -index 1a218f4..cffde5c 100644<br>
            ---- a/Resource/Init/<a href="http://pdf_base.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_base.ps</a><br>
            -+++ b/Resource/Init/<a href="http://pdf_base.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_base.ps</a><br>
            -@@ -157,7 +157,7 @@ currentdict /num-chars-dict .undef<br>
            -     {<br>
            -       dup ==only () = flush<br>
            -     } ifelse % PDFSTEP<br>
            --  } if % PDFDEBUG<br>
            -+  } executeonly if % PDFDEBUG<br>
            -   2 copy .knownget {<br>
            -     exch pop exch pop exch pop exec<br>
            -   } {<br>
            -diff --git a/Resource/Init/<a href="http://pdf_draw.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_draw.ps</a>
            b/Resource/Init/<a href="http://pdf_draw.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_draw.ps</a><br>
            -index e18a7c2..0a3924c 100644<br>
            ---- a/Resource/Init/<a href="http://pdf_draw.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_draw.ps</a><br>
            -+++ b/Resource/Init/<a href="http://pdf_draw.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_draw.ps</a><br>
            -@@ -501,8 +501,8 @@ end<br>
            -       (        Output may be incorrect.\n) pdfformaterror<br>
            -       //pdfdict /.gs_warning_issued //true .forceput<br>
            -       PDFSTOPONERROR { /gs /undefined signalerror } if<br>
            --    } if<br>
            --  }<br>
            -+    } executeonly if<br>
            -+  } executeonly<br>
            -   ifelse<br>
            - } bind executeonly def<br>
            - <br>
            -@@ -1142,7 +1142,7 @@ currentdict end readonly def<br>
            -           .setglobal<br>
            -           pdfformaterror<br>
            -         } executeonly ifelse<br>
            --      }<br>
            -+      } executeonly<br>
            -       {<br>
            -         currentglobal //pdfdict gcheck .setglobal<br>
            -         //pdfdict /.Qqwarning_issued //true .forceput<br>
            -@@ -1150,8 +1150,8 @@ currentdict end readonly def<br>
            -         pdfformaterror<br>
            -       } executeonly ifelse<br>
            -       end<br>
            --    } ifelse<br>
            --  } loop<br>
            -+    } executeonly ifelse<br>
            -+  } executeonly loop<br>
            -   {<br>
            -     (\n   **** Error: File has unbalanced q/Q operators
            \(too many q's\)\n               Output may be incorrect.\n)<br>
            -     //pdfdict /.Qqwarning_issued .knownget<br>
            -@@ -1165,14 +1165,14 @@ currentdict end readonly def<br>
            -         .setglobal<br>
            -         pdfformaterror<br>
            -       } executeonly ifelse<br>
            --    }<br>
            -+    } executeonly<br>
            -     {<br>
            -       currentglobal //pdfdict gcheck .setglobal<br>
            -       //pdfdict /.Qqwarning_issued //true .forceput<br>
            -       .setglobal<br>
            -       pdfformaterror<br>
            -     } executeonly ifelse<br>
            --  } if<br>
            -+  } executeonly if<br>
            -   pop<br>
            - <br>
            -   % restore pdfemptycount<br>
            -diff --git a/Resource/Init/<a href="http://pdf_font.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_font.ps</a>
            b/Resource/Init/<a href="http://pdf_font.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_font.ps</a><br>
            -index 2df3303..6a6a5fe 100644<br>
            ---- a/Resource/Init/<a href="http://pdf_font.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_font.ps</a><br>
            -+++ b/Resource/Init/<a href="http://pdf_font.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_font.ps</a><br>
            -@@ -638,7 +638,7 @@ currentdict end readonly def<br>
            -                   currentglobal 2 index dup gcheck
            setglobal<br>
            -                   /FontInfo 5 dict dup 5 1 roll .forceput<br>
            -                   setglobal<br>
            --                } if<br>
            -+                } executeonly if<br>
            -                 dup /GlyphNames2Unicode .knownget not {<br>
            -                   //true                        % No
            existing G2U, make one<br>
            -                 } {<br>
            -@@ -668,10 +668,12 @@ currentdict end readonly def<br>
            -                 pop                                     %
            font-res font-dict encoding|null font-info<br>
            -                 pop                                     %
            font-res font-dict encoding|null<br>
            -                 //false                                 %
            We built a GlyphNames2Unicode table, don't need to process
            further<br>
            --              }{<br>
            -+              } executeonly<br>
            -+              {<br>
            -                 //true                                  %
            name is not Identity-V or H, fail by falling through<br>
            -               }ifelse<br>
            --          } {<br>
            -+          } executeonly<br>
            -+          {<br>
            -             //true<br>
            -           } ifelse                                      %
            not a name, try as a dictionary (as specified)<br>
            - <br>
            -@@ -759,9 +761,9 @@ currentdict end readonly def<br>
            -           PDFDEBUG {<br>
            -             (.processToUnicode end) =<br>
            -           } if<br>
            --        } if<br>
            --      } if<br>
            --    } stopped<br>
            -+        } executeonly if<br>
            -+      } executeonly if<br>
            -+    } executeonly stopped<br>
            -     {<br>
            -       .dstackdepth 1 countdictstack 1 sub<br>
            -       {pop end} for<br>
            -@@ -1291,19 +1293,20 @@ currentdict /eexec_pdf_param_dict
            .undef<br>
            -                 //pdfdict /.Qqwarning_issued //true
            .forceput<br>
            -               } executeonly if<br>
            -               Q<br>
            --            } repeat<br>
            -+            } executeonly repeat<br>
            -             Q<br>
            --          } PDFfile fileposition 2 .execn % Keep pdfcount
            valid.<br>
            -+          } executeonly PDFfile fileposition 2 .execn %
            Keep pdfcount valid.<br>
            -           PDFfile exch setfileposition<br>
            --        } ifelse<br>
            --      } {<br>
            -+        } executeonly ifelse<br>
            -+      } executeonly<br>
            -+      {<br>
            -         % PDF Type 3 fonts don't use .notdef<br>
            -         % d1 implementation adjusts the width as needed<br>
            -         0 0 0 0 0 0<br>
            -         pdfopdict /d1 get exec<br>
            -       } ifelse<br>
            -       end end<br>
            --    } bdef<br>
            -+    } executeonly bdef<br>
            -     dup currentdict Encoding .processToUnicode<br>
            -     currentdict end .completefont exch pop<br>
            - } bind executeonly odef<br>
            -@@ -2103,9 +2106,9 @@ currentdict /CMap_read_dict undef<br>
            -           (Will continue, but content may be missing.) =
            flush<br>
            -         } ifelse<br>
            -       } if<br>
            --    } if<br>
            -+    } executeonly if<br>
            -     /findresource cvx /undefined signalerror<br>
            --  } loop<br>
            -+  } executeonly loop<br>
            - } bind executeonly odef<br>
            - <br>
            - /buildCIDType0 {      % &lt;CIDFontType0-font-resource&gt;
            buildCIDType0 &lt;font&gt;<br>
            -diff --git a/Resource/Init/<a href="http://pdf_main.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_main.ps</a>
            b/Resource/Init/<a href="http://pdf_main.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_main.ps</a><br>
            -index 5305ea6..a59e63c 100644<br>
            ---- a/Resource/Init/<a href="http://pdf_main.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_main.ps</a><br>
            -+++ b/Resource/Init/<a href="http://pdf_main.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_main.ps</a><br>
            -@@ -2749,15 +2749,15 @@ currentdict /PDF2PS_matrix_key
            undef<br>
            -           .setglobal<br>
            -           pdfformaterror<br>
            -         } executeonly ifelse<br>
            --      }<br>
            -+      } executeonly<br>
            -       {<br>
            -         currentglobal //pdfdict gcheck .setglobal<br>
            -         //pdfdict /.Qqwarning_issued //true .forceput<br>
            -         .setglobal<br>
            -         pdfformaterror<br>
            -       } executeonly ifelse<br>
            --    } if<br>
            --  } if<br>
            -+    } executeonly if<br>
            -+  } executeonly if<br>
            -   pop<br>
            -   count PDFexecstackcount sub { pop } repeat<br>
            -   (after exec) VMDEBUG<br>
            -diff --git a/Resource/Init/<a href="http://pdf_ops.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_ops.ps</a>
            b/Resource/Init/<a href="http://pdf_ops.ps" rel="noreferrer"
              target="_blank" moz-do-not-send="true">pdf_ops.ps</a><br>
            -index 285e582..6c1f100 100644<br>
            ---- a/Resource/Init/<a href="http://pdf_ops.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_ops.ps</a><br>
            -+++ b/Resource/Init/<a href="http://pdf_ops.ps"
              rel="noreferrer" target="_blank" moz-do-not-send="true">pdf_ops.ps</a><br>
            -@@ -186,14 +186,14 @@ currentdict /gput_always_allow .undef<br>
            -         .setglobal<br>
            -         pdfformaterror<br>
            -       } executeonly ifelse<br>
            --    }<br>
            -+    } executeonly<br>
            -     {<br>
            -       currentglobal //pdfdict gcheck .setglobal<br>
            -       //pdfdict /.Qqwarning_issued //true .forceput<br>
            -       .setglobal<br>
            -       pdfformaterror<br>
            -     } executeonly ifelse<br>
            --  } if<br>
            -+  } executeonly if<br>
            - } bind executeonly odef<br>
            - <br>
            - % Save PDF gstate<br>
            -@@ -440,11 +440,12 @@ currentdict /gput_always_allow .undef<br>
            -   dup type /booleantype eq {<br>
            -     .currentSMask type /dicttype eq {<br>
            -       .currentSMask /Processed 2 index .forceput<br>
            -+    } executeonly<br>
            -+    {<br>
            -+      .setSMask<br>
            -+    }ifelse<br>
            -   } executeonly<br>
            -   {<br>
            --      .setSMask<br>
            --  }ifelse<br>
            --  }{<br>
            -   .setSMask<br>
            -   }ifelse<br>
            - <br>
            --- <br>
            -2.20.1<br>
            -<br>
            diff --git a/meta/recipes-extended/ghostscript/<a
              href="http://ghostscript_9.27.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">ghostscript_9.27.bb</a>
            b/meta/recipes-extended/ghostscript/<a
              href="http://ghostscript_9.50.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">ghostscript_9.50.bb</a><br>
            similarity index 92%<br>
            rename from meta/recipes-extended/ghostscript/<a
              href="http://ghostscript_9.27.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">ghostscript_9.27.bb</a><br>
            rename to meta/recipes-extended/ghostscript/<a
              href="http://ghostscript_9.50.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">ghostscript_9.50.bb</a><br>
            index 32f938f254..39c32644db 100644<br>
            --- a/meta/recipes-extended/ghostscript/<a
              href="http://ghostscript_9.27.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">ghostscript_9.27.bb</a><br>
            +++ b/meta/recipes-extended/ghostscript/<a
              href="http://ghostscript_9.50.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">ghostscript_9.50.bb</a><br>
            @@ -19,15 +19,12 @@ DEPENDS_class-native = "libpng-native"<br>
             UPSTREAM_CHECK_URI = "<a
              href="https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/ArtifexSoftware/ghostpdl-downloads/releases</a>"<br>
             UPSTREAM_CHECK_REGEX = "(?P&lt;pver&gt;\d+(\.\d+)+)\.tar"<br>
            <br>
            -SRC_URI_BASE = "<a
href="https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927/$%7BBPN%7D-$%7BPV%7D.tar.gz"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927/${BPN}-${PV}.tar.gz</a>
            \<br>
            +SRC_URI_BASE = "<a
href="https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs950/$%7BBPN%7D-$%7BPV%7D.tar.gz"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs950/${BPN}-${PV}.tar.gz</a>
            \<br>
                             <a class="moz-txt-link-freetext" href="file://ghostscript-9.15-parallel-make.patch">file://ghostscript-9.15-parallel-make.patch</a>
            \<br>
                           
             <a class="moz-txt-link-freetext" href="file://ghostscript-9.16-Werror-return-type.patch">file://ghostscript-9.16-Werror-return-type.patch</a> \<br>
                           
             <a class="moz-txt-link-freetext" href="file://do-not-check-local-libpng-source.patch">file://do-not-check-local-libpng-source.patch</a> \<br>
                             <a class="moz-txt-link-freetext" href="file://avoid-host-contamination.patch">file://avoid-host-contamination.patch</a> \<br>
                             <a class="moz-txt-link-freetext" href="file://mkdir-p.patch">file://mkdir-p.patch</a> \<br>
            -                <a class="moz-txt-link-freetext" href="file://CVE-2019-14811-0001.patch">file://CVE-2019-14811-0001.patch</a> \<br>
            -                <a class="moz-txt-link-freetext" href="file://CVE-2019-14817-0001.patch">file://CVE-2019-14817-0001.patch</a> \<br>
            -                <a class="moz-txt-link-freetext" href="file://CVE-2019-14817-0002.patch">file://CVE-2019-14817-0002.patch</a> \<br>
                             <a class="moz-txt-link-freetext" href="file://CVE-2019-14869-0001.patch">file://CVE-2019-14869-0001.patch</a> \<br>
             "<br>
            <br>
            @@ -43,8 +40,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \<br>
                                   
             <a class="moz-txt-link-freetext" href="file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch">file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch</a>
            \<br>
                                     "<br>
            <br>
            -SRC_URI[md5sum] = "c3990a504a3a23b9babe9de00ed6597d"<br>
            -SRC_URI[sha256sum] =
            "9760e8bdd07a08dbd445188a6557cb70e60ccb6a5601f7dbfba0d225e28ce285"<br>
            +SRC_URI[md5sum] = "00970cf622bd5b46f68eec9383753870"<br>
            +SRC_URI[sha256sum] =
            "0f53e89fd647815828fc5171613e860e8535b68f7afbc91bf89aee886769ce89"<br>
            <br>
             # Put something like<br>
             #<br>
            -- <br>
            2.24.0<br>
            <br>
            -- <br>
            _______________________________________________<br>
            Openembedded-core mailing list<br>
            <a href="mailto:Openembedded-core@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
            <a
              href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------849EBDF5032257A0581C03AC--
