Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3B75B6D732
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 14:59:42 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VgyOV-0001Hq-K2; Thu, 14 Nov 2013 15:59:43 +0100
Message-ID: <1384441182.17320.68.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2013 14:59:42 +0000
In-Reply-To: <CAMKF1spw=ARc3dXgTX4k9E4T4y39Vctyx9RNeeaAqoj9zfcYUw@mail.gmail.com>
References: <1384440081.17320.65.camel@phil-desktop.brightsign>
	<CAMKF1spw=ARc3dXgTX4k9E4T4y39Vctyx9RNeeaAqoj9zfcYUw@mail.gmail.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Thu, 2013-11-14 at 06:53 -0800,
	Khem Raj wrote: > > > On
	Thursday, November 14, 2013, Phil Blundell wrote: > > Boost::thread uses
	functions from boost::atomic but doesn't > actually > link with
	libboost_atomic.
	This works fine on platforms where > BOOST_ATOMIC_FLAG_LOCK_FREE is
	true
	but will lead to undefined > symbol references otherwise. Fix this by
	applying
	a patch > from > the upstream bug tracker to add the missing library
	linkage.
	> > > > Is it fixed in 1.55? Then we might apply this to Dora and
	upgrade > master to 1.55 [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	0.0 HTML_MESSAGE           BODY: HTML included in message
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: Add patch to avoid undefined references to boost::atomic::lockpool::get_lock_for()
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
X-List-Received-Date: Thu, 14 Nov 2013 14:59:43 -0000
Content-Type: multipart/alternative; boundary="=-0EWectTD9Lxh+ypw80fv"

--=-0EWectTD9Lxh+ypw80fv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-14 at 06:53 -0800, Khem Raj wrote:

> 
> 
> On Thursday, November 14, 2013, Phil Blundell wrote:
> 
>         Boost::thread uses functions from boost::atomic but doesn't
>         actually
>         link with libboost_atomic.  This works fine on platforms where
>         BOOST_ATOMIC_FLAG_LOCK_FREE is true but will lead to undefined
>         symbol references otherwise.  Fix this by applying a patch
>         from
>         the upstream bug tracker to add the missing library linkage.
>         
> 
> 
> Is it fixed in 1.55? Then we might apply this to Dora and upgrade
> master to 1.55 

According to the 1.55 release notes, yes:

Thread: 
        New Features: 
        
                #8519 Synchro: Update class barrier with a completion
                function. 
                #8515 Async: Add shared_future::then. 
                #8519 Synchro: Update class barrier with a completion
                function 
                #8615 Async: Replace make_future/make_shared_future by
                make_ready_future. 
                #8627 Async: Add future<>::unwrap and unwrapping
                constructor. 
                #8677 Async: Add future<>::get_or. 
                #8678 Async: Add future<>::fallback_to. 
                #8891 upgrade_to_unique_lock: missing mutex() function. 
                #8955 Request for more efficient way to get
                exception_ptr from future. 
        Fixed Bugs: 
        
                #7461 detail::win32::ReleaseSemaphore may be called with
                count_to_release equal to 0 
                #8070 prefer GetTickCount64 over GetTickCount 
                #8768 win32 condition_variable::wait_until infinite wait
                in rare cases. 
                #8817 Boost Thread Windows CE _createthreadex handling
                breaks mingw w64. 
                #8943 Failed to compile code using boost::call_once with
                Intel C++ Composer XE 2013 on Windows. 
                #8931 Typos in external_locking reference. 
                #9029 Misprint in documentation. 
                #9037 gcc -Wshadow gives warnings in
                condition_variable{,_fwd}.hpp. 
                #9041 Boost.Thread DSO's may need to link with
                Boost.Atomic. 
                #9048 boost::scoped_thread useless ctor with variadic
                template arguments. 
                #9079 Condition variable will wait forever for some
                timepoint values (Win). 

p.


--=-0EWectTD9Lxh+ypw80fv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.4.4">
</HEAD>
<BODY>
On Thu, 2013-11-14 at 06:53 -0800, Khem Raj wrote:<BR>
<BLOCKQUOTE TYPE=CITE>
    <BR>
    <BR>
    On Thursday, November 14, 2013, Phil Blundell wrote:<BR>
    <BLOCKQUOTE>
        Boost::thread uses functions from boost::atomic but doesn't actually<BR>
        link with libboost_atomic. &nbsp;This works fine on platforms where<BR>
        BOOST_ATOMIC_FLAG_LOCK_FREE is true but will lead to undefined<BR>
        symbol references otherwise. &nbsp;Fix this by applying a patch from<BR>
        the upstream bug tracker to add the missing library linkage.
    </BLOCKQUOTE>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BR>
    <BR>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    Is it fixed in 1.55? Then we might apply this to Dora and upgrade master to 1.55&nbsp;
</BLOCKQUOTE>
<BR>
According to the 1.55 release notes, yes:<BR>
<BR>
<A HREF="http://www.boost.org/libs/Thread/">Thread</A>: 
<UL>
    <I>New Features:</I> 
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8519">#8519</A> Synchro: Update class barrier with a completion function. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8515">#8515</A> Async: Add <TT>shared_future::then</TT>. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8519">#8519</A> Synchro: Update class barrier with a completion function 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8615">#8615</A> Async: Replace make_future/make_shared_future by make_ready_future. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8627">#8627</A> Async: Add future&lt;&gt;::unwrap and unwrapping constructor. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8677">#8677</A> Async: Add future&lt;&gt;::get_or. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8678">#8678</A> Async: Add future&lt;&gt;::fallback_to. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8891">#8891</A> upgrade_to_unique_lock: missing mutex() function. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8955">#8955</A> Request for more efficient way to get exception_ptr from future. 
    </UL>
</UL>
<UL>
    <I>Fixed Bugs:</I> 
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/7461">#7461</A> detail::win32::ReleaseSemaphore may be called with count_to_release equal to 0 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8070">#8070</A> prefer GetTickCount64 over GetTickCount 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8768">#8768</A> win32 condition_variable::wait_until infinite wait in rare cases. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8817">#8817</A> Boost Thread Windows CE _createthreadex handling breaks mingw w64. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8943">#8943</A> Failed to compile code using boost::call_once with Intel C++ Composer XE 2013 on Windows. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/8931">#8931</A> Typos in external_locking reference. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/9029">#9029</A> Misprint in documentation. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/9037">#9037</A> gcc -Wshadow gives warnings in condition_variable{,_fwd}.hpp. 
    </UL>
</UL>
<UL>
    <UL>
        <B><A HREF="http://svn.boost.org/trac/boost/ticket/9041">#9041</A> Boost.Thread DSO's may need to link with Boost.Atomic. </B>
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/9048">#9048</A> boost::scoped_thread useless ctor with variadic template arguments. 
    </UL>
</UL>
<UL>
    <UL>
        <A HREF="http://svn.boost.org/trac/boost/ticket/9079">#9079</A> Condition variable will wait forever for some timepoint values (Win). 
    </UL>
</UL>
<BR>
p.<BR>
<BR>
</BODY>
</HTML>

--=-0EWectTD9Lxh+ypw80fv--
