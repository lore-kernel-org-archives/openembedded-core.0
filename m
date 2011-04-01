Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1T-00059V-DB
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:47 +0200
Received: by gxk3 with SMTP id 3so1294555gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=7+Cj7QnAzY2sdeEMQgYUfvI9bd5EDqjmFd4J+KZoyJ4=;
	b=JRpOIFNXrW6CGnib8dT/IjLlQFu6HYZ7hfWgZV2z3DDh4EwjDMWv962kiYvwSLRtR+
	snEBAgbjojUt0eWEUAzgk0UHaT318FdLHxcFzygwaNNfxPFPD8sH8jN5YfroOSWpoMBw
	1Gl1e9DKGT0mBhumxn7EeEIbYVEXW7swGyCtc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gbU2b4Pa4hHNWLSFEAyi2gh8zrP5RqLoh2aajFF6+gccxOFvQuwyMiiU+FO/3Qf94y
	uLyNIPCkis1zfaLmQRA6b+scVqmUo90Ij0l11XVRcWF2uyefFYFMdbo8MfscAenQ4N2g
	v3rszuLTVaETfATT1+Y4mLOpROxBp4H06RE1M=
Received: by 10.236.78.36 with SMTP id f24mr2623866yhe.250.1301632182620;
	Thu, 31 Mar 2011 21:29:42 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id l65sm948517yhn.39.2011.03.31.21.29.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:33 -0700
Message-Id: <727e14088ae90f5662a7905c3ced4a5a39eb9ce3.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 26/46] perl_5.12.2.bb: By defualt undefine features not found in uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2011 04:31:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/perl-5.12.2/config.sh |   14 +++++++-------
 meta/recipes-devtools/perl/perl_5.12.2.bb        |   10 ++++++++++
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-5.12.2/config.sh b/meta/recipes-devtools/perl/perl-5.12.2/config.sh
index 12d44a8..77067e1 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.12.2/config.sh
@@ -87,7 +87,7 @@ cat='cat'
 cc='gcc'
 cccdlflags='-fPIC'
 ccdlflags='-Wl,-E -Wl,-rpath,/usr/lib/perl5/5.12.2/@ARCH@-thread-multi/CORE'
-ccflags='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-protector -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
+ccflags='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccname='gcc'
 ccsymbols=''
@@ -108,7 +108,7 @@ cpio=''
 cpp='cpp'
 cpp_stuff='42'
 cppccsymbols=''
-cppflags='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-protector'
+cppflags='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe'
 cpplast='-'
 cppminus='-'
 cpprun='gcc -E'
@@ -194,7 +194,7 @@ d_dosuid='undef'
 d_drand48_r='define'
 d_drand48proto='define'
 d_dup2='define'
-d_eaccess='define'
+d_eaccess='undef'
 d_endgrent='define'
 d_endgrent_r='undef'
 d_endhent='define'
@@ -490,12 +490,12 @@ d_statfs_f_flags='undef'
 d_statfs_s='define'
 d_statvfs='define'
 d_stdio_cnt_lval='undef'
-d_stdio_ptr_lval='define'
+d_stdio_ptr_lval='undef'
 d_stdio_ptr_lval_nochange_cnt='undef'
-d_stdio_ptr_lval_sets_cnt='define'
+d_stdio_ptr_lval_sets_cnt='undef'
 d_stdio_stream_array='undef'
-d_stdiobase='define'
-d_stdstdio='define'
+d_stdiobase='undef'
+d_stdstdio='undef'
 d_strchr='define'
 d_strcoll='define'
 d_strctcpy='define'
diff --git a/meta/recipes-devtools/perl/perl_5.12.2.bb b/meta/recipes-devtools/perl/perl_5.12.2.bb
index 184e1e7..0a6cf14 100644
--- a/meta/recipes-devtools/perl/perl_5.12.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.2.bb
@@ -145,6 +145,16 @@ do_configure() {
 	       -e 's,/perl5,/perl,g' \
             config.sh-${TARGET_ARCH}-${TARGET_OS}
 
+       case "${TARGET_ARCH}" in                                                                      
+                x86_64 | powerpc | s390)                                                              
+                        sed -i -e "s,\(need_va_copy=\)'undef',\1'define',g" \                         
+                                config.sh-${TARGET_ARCH}-${TARGET_OS}                                 
+                        ;;                                                                            
+                arm)                                                                                  
+                        sed -i -e "s,\(d_u32align=\)'undef',\1'define',g" \                           
+                                config.sh-${TARGET_ARCH}-${TARGET_OS}                                 
+                        ;;                                                                            
+        esac                                                                                          
         # These are strewn all over the source tree
         for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1 -d ":"` ; do
             echo Fixing: $foo
-- 
1.7.4.1



