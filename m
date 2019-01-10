Return-Path: <ftoth@telfort.nl>
Received: from radex-web.radex.nl (smtp.radex.nl [178.250.146.7])
	by mail.openembedded.org (Postfix) with ESMTP id D013B7503B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 16:23:49 +0000 (UTC)
Received: from [192.168.1.22] (cust-178-250-146-69.breedbanddelft.nl
	[178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id 072F12404C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 17:23:50 +0100 (CET)
From: Ferry Toth <ftoth@telfort.nl>
X-Mozilla-News-Host: news://news://news.gmane.org:119
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <bb4e7e77-fc77-d180-cf50-aecc92c42c24@telfort.nl>
Date: Thu, 10 Jan 2019 17:23:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
Subject: Sudden errors building Sumo
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
X-List-Received-Date: Thu, 10 Jan 2019 16:23:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

After a new checkout I am experiencing multiple errors building Sumo 
that might be related:
bison-3.0.4

cross-localedef-native_2.27

coreutils-8.29

On another machine with slightly out-of-date Sumo these problems do not 
occur.


Detail below.


Any ideas how to fix?

Ferry


virtual:native:/home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-devtools/bison/bison_3.0.4.bb:do_compile

| ../bison-3.0.4/lib/fseterr.c: In function 'fseterr':
| ../bison-3.0.4/lib/fseterr.c:77:3: error: #error "Please port gnulib 
fseterr.c to your platform! Look at the definitions of ferror and 
clearerr on your system, then report this to bug-gnulib."
| #error "Please port gnulib fseterr.c to your platform! Look at the 
definitions of ferror and clearerr on your system, then report this to 
bug-gnulib."
| ^~~~~


/home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-core/glibc/cross-localedef-native_2.27.bb:do_compile

| /home/ferry/Develop/tmp/out/linux64/build/tmp/hosttools/ld: 
argp-fmtstream.c:(.text+0x525): undefined reference to `_IO_fwide'
| /home/ferry/Develop/tmp/out/linux64/build/tmp/hosttools/ld: 
argp-help.o: in function `argp_failure':
| argp-help.c:(.text+0x20b3): undefined reference to `_IO_fwide'
| collect2: error: ld returned 1 exit status


virtual:native:/home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-core/coreutils/coreutils_8.29.bb:do_compile

| ../coreutils-8.29/lib/freadseek.c: In function 'freadptrinc':
| ../coreutils-8.29/lib/freadseek.c:68:3: error: #error "Please port 
gnulib freadseek.c to your platform! Look at the definition of getc, 
getc_unlocked on your system, then report this to bug-gnulib."
| #error "Please port gnulib freadseek.c to your platform! Look at the 
definition of getc, getc_unlocked on your system, then report this to 
bug-gnulib."
| ^~~~~


