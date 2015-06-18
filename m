Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd5638.kasserver.com (dd5638.kasserver.com [85.13.130.155])
	by mail.openembedded.org (Postfix) with ESMTP id BFC4073F7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 12:33:27 +0000 (UTC)
Received: from [129.70.144.65] (astra.TechFak.Uni-Bielefeld.DE [129.70.144.65])
	by dd5638.kasserver.com (Postfix) with ESMTPSA id BC8425600975;
	Thu, 18 Jun 2015 14:33:26 +0200 (CEST)
To: Moritz Blume <moritz.blume@bmw-carit.de>,
	openembedded-core@lists.openembedded.org
References: <1433921778-1835-1-git-send-email-moritz.blume@bmw-carit.de>
	<1433921778-1835-2-git-send-email-moritz.blume@bmw-carit.de>
	<5579DD2D.10104@herbrechtsmeier.net> <55818872.5000102@bmw-carit.de>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <5582B9C9.1060307@herbrechtsmeier.net>
Date: Thu, 18 Jun 2015 14:30:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <55818872.5000102@bmw-carit.de>
Subject: Re: [PATCH v3 2/2] cmake: Upgrade 2.8.12.2 -> 3.2.2
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
X-List-Received-Date: Thu, 18 Jun 2015 12:33:30 -0000
Content-Type: multipart/alternative;
	boundary="------------050904060902050004020808"

--------------050904060902050004020808
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Am 17.06.2015 um 16:47 schrieb Moritz Blume:
> On 11.06.2015 21:10, Stefan Herbrechtsmeier wrote:
>> Am 10.06.2015 um 09:36 schrieb Moritz Blume:
>>> Patches "qt4-fail-silent.patch" and "support-oe-qt4-tools-names.patch"
>>> were adapted in order to fit to CMake 3.2.2 (refer to the commit
>>> message in the respective patch for details).
>>> Patch "cmake-2.8.11.2-FindFreetype.patch" was dropped since it was
>>> rejected upstream and its functionality otherwise implemented in the
>>> meantime.
>>>
>>> Note that CMake 3 needs to have the full compiler path in the toolchain
>>> file (see cmake.bbclass).
>> Why is the full path needed?
>
> https://public.kitware.com/Bug/view.php?id=15251
>
> "Having a full path to the compiler is a new requirement starting in 
> CMake 3.0. The incompatibility was introduced across a major version 
> number bump and is considered acceptable. The project will have to be 
> fixed to use a full path."
The documentions [1] says something else:
The CMAKE_<LANG>_COMPILER variables may be set to full paths, or to 
names of compilers to search for in standard locations

> Without a full path, you get the following error message:
>
> CMake Error at CMakeLists.txt:5 (project):
> | The CMAKE_C_COMPILER:
> |
> | gcc
> |
> | is not a full path and was not found in the PATH.
> |
> | Tell CMake where to find the compiler by setting either the environment
> | variable "CC" or the CMake cache entry CMAKE_C_COMPILER to the full 
> path to
> | the compiler, or to the compiler name if it is in the PATH.
>
But this messages also says that the compiler was not found in the PATH.

>>
>> Have you try to add STAGING_BINDIR_TOOLCHAIN to the 
>> CMAKE_FIND_ROOT_PATH?
>
> I don't understand, is this related to the compiler path?
Yes, but this doesn't helps as CMAKE_<LAND>_COMPILER is not inside a 
/bin path. CMake use find_program to get the full path in 
Modules/CMakeDetermineCompiler.cmake.

<snip>

[1] 
http://www.cmake.org/cmake/help/v3.2/manual/cmake-toolchains.7.html#cross-compiling-for-linux


--------------050904060902050004020808
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Am 17.06.2015 um 16:47 schrieb Moritz
      Blume:<br>
    </div>
    <blockquote cite="mid:55818872.5000102@bmw-carit.de" type="cite">
      <meta content="text/html; charset=windows-1252"
        http-equiv="Content-Type">
      On 11.06.2015 21:10, Stefan Herbrechtsmeier wrote:<br>
      <blockquote cite="mid:5579DD2D.10104@herbrechtsmeier.net"
        type="cite">Am 10.06.2015 um 09:36 schrieb Moritz Blume: <br>
        <blockquote type="cite">Patches "qt4-fail-silent.patch" and
          "support-oe-qt4-tools-names.patch" <br>
          were adapted in order to fit to CMake 3.2.2 (refer to the
          commit <br>
          message in the respective patch for details). <br>
          Patch "cmake-2.8.11.2-FindFreetype.patch" was dropped since it
          was <br>
          rejected upstream and its functionality otherwise implemented
          in the <br>
          meantime. <br>
          <br>
          Note that CMake 3 needs to have the full compiler path in the
          toolchain <br>
          file (see cmake.bbclass). <br>
        </blockquote>
        Why is the full path needed? <br>
      </blockquote>
      <br>
      <a moz-do-not-send="true" class="moz-txt-link-freetext"
        href="https://public.kitware.com/Bug/view.php?id=15251">https://public.kitware.com/Bug/view.php?id=15251</a><br>
      <br>
      "Having a full path to the compiler is a new requirement starting
      in CMake 3.0. The incompatibility was introduced across a major
      version number bump and is considered acceptable. The project will
      have to be fixed to use a full path."<br>
    </blockquote>
    <font size="3">The documentions [1] says something else:<br>
      The CMAKE_&lt;LANG&gt;_COMPILER variables may be set to full
      paths, or to names of compilers to search for in standard
      locations<br>
      <br>
    </font>
    <blockquote cite="mid:55818872.5000102@bmw-carit.de" type="cite">
      Without a full path, you get the following error message:<br>
      <br>
      <font size="3">CMake Error at CMakeLists.txt:5 (project):<br>
        | The CMAKE_C_COMPILER:<br>
        | <br>
        | gcc<br>
        | <br>
        | is not a full path and was not found in the PATH.<br>
        | <br>
        | Tell CMake where to find the compiler by setting either the
        environment<br>
        | variable "CC" or the CMake cache entry CMAKE_C_COMPILER to the
        full path to<br>
        | the compiler, or to the compiler name if it is in the PATH.</font><br>
      <br>
    </blockquote>
    <font size="3">But this messages also says that the compiler was not
      found in the PATH.<br>
    </font><br>
    <blockquote cite="mid:55818872.5000102@bmw-carit.de" type="cite">
      <blockquote cite="mid:5579DD2D.10104@herbrechtsmeier.net"
        type="cite"> <br>
        Have you try to add STAGING_BINDIR_TOOLCHAIN to the
        CMAKE_FIND_ROOT_PATH? <br>
      </blockquote>
      <br>
      I don't understand, is this related to the compiler path?<br>
    </blockquote>
    Yes, but this doesn't helps as <font size="3">CMAKE_&lt;LAND&gt;_COMPILER
      is not inside a /bin path. CMake use find_program to get the full
      path in Modules/CMakeDetermineCompiler.cmake.<br>
      <br>
      &lt;snip&gt;<br>
    </font><br>
    [1]
<a class="moz-txt-link-freetext" href="http://www.cmake.org/cmake/help/v3.2/manual/cmake-toolchains.7.html#cross-compiling-for-linux">http://www.cmake.org/cmake/help/v3.2/manual/cmake-toolchains.7.html#cross-compiling-for-linux</a><br>
    <br>
  </body>
</html>

--------------050904060902050004020808--
