Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TMSTr-0003wa-Sd
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 01:47:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9BNYi85003360
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 16:34:44 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 11 Oct 2012 16:34:43 -0700
Date: Thu, 11 Oct 2012 18:34:42 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "openembedded-core@"
	<lists.openembedded.org.openembedded-core@lists.openembedded.org>
Message-ID: <20121011183442.0a79735e@e6410-2>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: site/mips64-common (not a review-ready patch)
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
X-List-Received-Date: Thu, 11 Oct 2012 23:47:56 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

So, turns out that siteinfo.bbclass is looking for mips64-common, but
there isn't one. The way this bit me was screen failing to compile
because stuff like screen_cv_sys_fifo_usable wasn't defined. So I've
drafted up and lightly tested a version of this... but it's been tested
against a several month old oe-core, and the only stuff I have to test
it again isn't going to work with modern oe-core until I do some
catching up and synchronizing.

So I'm sending the data (it's not large) in case anyone needs it and
has better resources for testing it. Only a couple of differences from
mips-common; long and ssize_t are 8 bytes in mips64 land, at least
with our compiler.

# general
ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}

# cvs
cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}

# screen
screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
screen_cv_sys_memcpy_overlap=${screen_cv_sys_memcpy_overlap=no}
screen_cv_sys_memmove_overlap=${screen_cv_sys_memmove_overlap=no}
screen_cv_sys_fifo_broken_impl=${screen_cv_sys_fifo_broken_impl=yes}
screen_cv_sys_fifo_usable=${screen_cv_sys_fifo_usable=yes}
screen_cv_sys_select_broken_retval=${screen_cv_sys_select_broken_retval=no}
screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}

# ORBit2
ac_cv_alignof_CORBA_octet=1
ac_cv_alignof_CORBA_boolean=1
ac_cv_alignof_CORBA_char=1
ac_cv_alignof_CORBA_wchar=2
ac_cv_alignof_CORBA_short=2
ac_cv_alignof_CORBA_long=8
ac_cv_alignof_CORBA_long_long=8
ac_cv_alignof_CORBA_float=4
ac_cv_alignof_CORBA_double=8
ac_cv_alignof_CORBA_long_double=8
ac_cv_alignof_CORBA_pointer=8
ac_cv_alignof_CORBA_struct=1

# apache
ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=8}
apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}

# glib
glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
ac_cv_alignof_guint32=4
ac_cv_alignof_guint64=8
ac_cv_alignof_unsigned_long=8


# slrn
slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}


-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


