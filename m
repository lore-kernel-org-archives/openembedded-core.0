Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 8A27F71A9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 08:21:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id AE635265784
Message-ID: <1508228478.12731.1.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: "Burton, Ross" <ross.burton@intel.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Date: Tue, 17 Oct 2017 10:21:18 +0200
In-Reply-To: <CAJTo0LbsxAbhK=XnqB0fMQXbju7gDGhu_9vnB5tg_0uCNhEnow@mail.gmail.com>
References: <20171016172158.22773-1-fabien.lahoudere@collabora.co.uk>
	<20171016172158.22773-3-fabien.lahoudere@collabora.co.uk>
	<CAP9ODKp4-ohZnA6tkDBaQKqUE_YDTLOQeGNpUTzV5zHH294quw@mail.gmail.com>
	<CAJTo0LbsxAbhK=XnqB0fMQXbju7gDGhu_9vnB5tg_0uCNhEnow@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 3/3] weston: Bump version to 3.0.0
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
X-List-Received-Date: Tue, 17 Oct 2017 08:21:23 -0000
Content-Type: multipart/alternative; boundary="=-aXGwFDa+chMqylppLs5h"

--=-aXGwFDa+chMqylppLs5h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-10-16 at 21:34 +0100, Burton, Ross wrote:
> On 16 October 2017 at 18:30, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
> > > +          file://weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch \
> > 
> > > +          file://fix-missing-header.patch \
> > 
> > 
> > 
> > Those should be documented on commit log
> > 
> > 
> > 
> 
> Agreed.  The missing header one should say what platform causes it to be a problem (in case it
> never gets upstreamed and someone tests it again on just glibc).  And is the pitch patch
> sufficiently broken that we need to backport it?

Without the pitch patch, all applications generating YUV420 will not be displayed correctly. For
example "gstlaunch1.0 testvideosrc ! waylandsink" fail.I can keep this patch in a bbappend if you
don't want it. Just tell me.
For the header patch, I will improve commit message.
I see there is an OVERRIDE libc-musl, should I use this patch in SRC_URI_libc-musl?
> Ross 
-- 
Fabien

--=-aXGwFDa+chMqylppLs5h
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Mon, 2017-10-16 at 21:34 +0100, Burton, Ross wrote:</div><blockquote type="cite"><div dir="ltr">On 16 October 2017 at 18:30, Otavio Salvador <span dir="ltr">&lt;<a href="mailto:otavio.salvador@ossystems.com.br" target="_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div class="gmail_extra"><div class="gmail_quote"><blockquote type="cite"><div class="HOEnZb"><div class="h5"><br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://weston-gl-renderer-Set-<wbr>pitch-correctly-for-<wbr>subsampled-textures.patch \<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://fix-missing-header.<wbr>patch \<br>
<br>
</div></div>Those should be documented on commit log<br>
<div class="HOEnZb"><div class="h5"><br></div></div><br></blockquote><div><br></div><div>Agreed.&nbsp; The missing header one should say what platform causes it to be a problem (in case it never gets upstreamed and someone tests it again on just glibc).&nbsp; And is the pitch patch sufficiently broken that we need to backport it?</div></div></div></div></blockquote><div><br></div><div>Without the pitch patch, all applications generating YUV420 will not be displayed correctly. For example "gstlaunch1.0 testvideosrc ! waylandsink" fail.</div><div>I can keep this patch in a bbappend if you don't want it. Just tell me.</div><div><br></div><div>For the header patch, I will improve commit message.</div><div><br></div><div>I see there is an OVERRIDE libc-musl, should I use this patch in SRC_URI_libc-musl?</div><div><br></div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra"><div class="gmail_quote"><div><br></div><div>Ross&nbsp;</div></div></div></div>
</blockquote><div><span><pre>-- <br></pre><div style="width: 100ch;">Fabien</div></span></div></body></html>

--=-aXGwFDa+chMqylppLs5h--
