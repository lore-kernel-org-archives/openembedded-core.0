Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TiwKN-0002PZ-4v
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 01:07:03 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBCNqRNu019063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Dec 2012 15:52:28 -0800 (PST)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 12 Dec 2012 15:52:26 -0800
Message-ID: <50C918B5.3040105@windriver.com>
Date: Thu, 13 Dec 2012 07:52:21 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1355302441.git.hongxu.jia@windriver.com>
	<a865b540a43bfce79677902ec1700cf981aa5336.1355302441.git.hongxu.jia@windriver.com>
	<CA+chaQf3duuv42xXigRdQ40eBDkTNGGp3G+nrWO8ouy0gAQv+g@mail.gmail.com>
In-Reply-To: <CA+chaQf3duuv42xXigRdQ40eBDkTNGGp3G+nrWO8ouy0gAQv+g@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ghostscript-native: disable libtiff support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 00:07:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2012 03:49 AM, Martin Jansa wrote:
> On Wed, Dec 12, 2012 at 11:00 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> The ghostscript-native will check libtiff
>> automatically at configure time and libtiff
>> needs libjpeg. If libtiff and libjpeg is
>> just populated to staging native directories
>> and the host doesn't install them, the libjpeg
>> could not be linked, fail with:
> Can you disable freetype/fontconfig too? It's underlinking.

All right, I will work on it.

Thanks,
Hongxu

> | gcc -O2 -isystem/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include
>   -Wall -Wstrict-prototypes -Wundef -Wmissing-declarations
> -Wmissing-prototypes -Wwrite-strings -Wno-strict-aliasing
> -Wdeclaration-after-statement -fno-builtin -fno-common
> -DHAVE_STDINT_H=1 -DHAVE_SYS_TIME_H=1 -DGX_COLOR_INDEX_TYPE="unsigned
> long int" -isystem/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include
> -O2 -pipe -DHAVE_SYS_TIME_H=1    -O2
> -isystem/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include
>   -Wall -Wstrict-prototypes -Wundef -Wmissing-declarations
> -Wmissing-prototypes -Wwrite-strings -Wno-strict-aliasing
> -Wdeclaration-after-statement -fno-builtin -fno-common
> -DHAVE_STDINT_H=1 -DHAVE_SYS_TIME_H=1 -DGX_COLOR_INDEX_TYPE="unsigned
> long int" -isystem/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include
> -O2 -pipe -DHAVE_SYS_TIME_H=1   -I./base -I./obj/ -Izlib
> ./base/mkromfs.c -o ./obj/aux/mkromfs_0 ./obj/aux/compress.o
> ./obj/aux/deflate.o ./obj/aux/zutil.o ./obj/aux/adler32.o
> ./obj/aux/crc32.o ./obj/aux/trees.o ./obj/aux/gscdefs.o
> ./obj/aux/gsmisc.o ./obj/aux/gpmisc.o ./obj/aux/gslibctx.o
> ./obj/aux/gp_getnv.o ./obj/aux/gp_unix.o ./obj/aux/gp_unifs.o
> ./obj/aux/gp_unifn.o ./obj/aux/gp_stdia.o ./obj/aux/gsutil.o
> ./obj/aux/memento.o -lm  -ldl -lm  -rdynamic -ldl
> -L/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib
> -lfontconfig
> | /usr/lib/gcc/x86_64-pc-linux-gnu/4.7.2/../../../../x86_64-pc-linux-gnu/bin/ld:
> warning: libfreetype.so.6, needed by
> /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so,
> not found (try using -rpath or -rpath-link)
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Get_Sfnt_Name_Count'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Get_Glyph_Name'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Load_Glyph'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Get_X11_Font_Format'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Load_Sfnt_Table'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Done_Face'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Done_FreeType'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_New_Face'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Init_FreeType'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Get_First_Char'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Get_PS_Font_Info'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Select_Charmap'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Get_Sfnt_Table'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Select_Size'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Get_Char_Index'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Get_Next_Char'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Has_PS_Glyph_Names'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Get_BDF_Property'
> | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libfontconfig.so:
> undefined reference to `FT_Get_Sfnt_Name'
> | collect2: error: ld returned 1 exit status
> | make: *** [obj/aux/mkromfs_0] Error 1
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see
> /OE/jansa-test/shr-core/tmp-eglibc/work/x86_64-linux/ghostscript-native/9.05-r5/temp/log.do_compile.21213
> for further information)
> NOTE: recipe ghostscript-native-9.05-r5: task do_compile: Failed
>
> Cheers,



