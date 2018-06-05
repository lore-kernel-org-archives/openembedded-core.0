Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 28F6177086
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 10:36:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w55AaVHU027013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 5 Jun 2018 11:36:32 +0100
Message-ID: <73a2a78cd6778812d9983f044f374e6c2de0b248.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Martin Kelly
	<mkelly@xevo.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jun 2018 11:36:31 +0100
In-Reply-To: <248cbe41837f42c88d3b38cefec71a4b@XBOX02.axis.com>
References: <20180604230602.8461-1-mkelly@xevo.com>
	<20180604230602.8461-2-mkelly@xevo.com>
	<248cbe41837f42c88d3b38cefec71a4b@XBOX02.axis.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v3 1/6] toolchain-scripts: retab file
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
X-List-Received-Date: Tue, 05 Jun 2018 10:36:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-06-05 at 10:09 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of
> > Martin Kelly
> > Sent: den 5 juni 2018 01:06
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH v3 1/6] toolchain-scripts: retab file
> > 
> > Two functions is uses a mix of spaces and tabs. The rest of the
> > file
> > uses tabs, so switch to tabs uniformly.
> > 
> > Signed-off-by: Martin Kelly <mkelly@xevo.com>
> > ---
> >  meta/classes/toolchain-scripts.bbclass | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/meta/classes/toolchain-scripts.bbclass
> > b/meta/classes/toolchain-scripts.bbclass
> > index 71da5e5409..a72436167c 100644
> > --- a/meta/classes/toolchain-scripts.bbclass
> > +++ b/meta/classes/toolchain-scripts.bbclass
> > @@ -122,7 +122,7 @@ toolchain_create_post_relocate_script() {
> >  	rm -f $script
> >  	touch $script
> > 
> > -    cat >> $script <<EOF
> > +	cat >> $script <<EOF
> >  if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
> >      for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*.sh; do
> >          \$s "\$1"
> 
> This part should be indented using tabs as well.
> 
> > @@ -166,13 +166,13 @@ toolchain_create_sdk_siteconfig () {
> >  toolchain_create_sdk_siteconfig[vardepsexclude] =
> > "TOOLCHAIN_CONFIGSITE_SYSROOTCACHE"
> > 
> >  python __anonymous () {
> > -    import oe.classextend
> > -    deps = ""
> > -    for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or
> > "").split():
> > -        deps += " %s:do_populate_sysroot" % dep
> > -        for variant in (d.getVar('MULTILIB_VARIANTS') or
> > "").split():
> > -            clsextend = oe.classextend.ClassExtender(variant, d)
> > -            newdep = clsextend.extend_name(dep)
> > -            deps += " %s:do_populate_sysroot" % newdep
> > -    d.appendVarFlag('do_configure', 'depends', deps)
> > +	import oe.classextend
> > +	deps = ""
> > +	for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or
> > "").split():
> > +		deps += " %s:do_populate_sysroot" % dep
> > +		for variant in (d.getVar('MULTILIB_VARIANTS') or
> > "").split():
> > +			clsextend =
> > oe.classextend.ClassExtender(variant, d)
> > +			newdep = clsextend.extend_name(dep)
> > +			deps += " %s:do_populate_sysroot" % newdep
> > +	d.appendVarFlag('do_configure', 'depends', deps)
> 
> This is Python code. I believe the OE-Core standard is for Python
> code 
> to be indented using four spaces (whereas shell code should be
> indented 
> using tabs).

I noticed this last bit and simply dropped that patch hunk.

Cheers,

Richard

