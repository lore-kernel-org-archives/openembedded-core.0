Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 82CC37713D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:21:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 19 Feb 2016 01:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208,217";a="50765805"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:21:08 -0800
Message-ID: <1455873667.2298.0.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 11:21:07 +0200
In-Reply-To: <CABcZANmsXr=_Tim1MNpBcDxSJOu34THuzMejVo_bYm5e3XGOiA@mail.gmail.com>
References: <1455805135-20814-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1455805135-20814-3-git-send-email-markus.lehtonen@linux.intel.com>
	<CABcZANmsXr=_Tim1MNpBcDxSJOu34THuzMejVo_bYm5e3XGOiA@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCH v2 2/2] devtool: update-recipe: create config fragment
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
X-List-Received-Date: Fri, 19 Feb 2016 09:21:09 -0000
Content-Type: multipart/alternative; boundary="=-XQF7o4yrFkt2NYEZ5/VK"

--=-XQF7o4yrFkt2NYEZ5/VK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-02-18 at 15:19 +0000, Christopher Larson wrote:
> 
> 
> On Thu, Feb 18, 2016 at 7:19 AM Markus Lehtonen <
> markus.lehtonen@linux.intel.com> wrote:
> > Create config fragment if the user makes modifications to kernel
> > config.
> > User may change .config e.g. by directly editing it or by running
> > the
> > 'do_menuconfig' bitbake task. Devtool generates one monolithic
> > fragment
> > by simply doing a diff between .config and .config.baseline files
> > in the
> > source directory.  If either of these files is missing, the config
> > fragment is not gerenrated or updated. The output is a file,
> > 'devtool-fragment.cfg' that gets added to SRC_URI in the recipe (as
> > well
> > as copied into the 'oe-local-files' directory if that is present in
> > the
> > source tree).
> > 
> > ${S}/.config will be a symlink to ${B}/.config. We need to do this
> > as
> > devtool is not able to access ${B} because ${B} is set in a
> > .bbappend in
> > the workspace layer which is not parsed by devtool itself.
> > 
> > [YOCTO #8999]
> > 
> > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> If the devtool-fragment.cfg already exists, what's the behavior? Will
> it update it with both the old and new changes, or will it create a
> second fragment?
Currently, it will update the existing fragment.
   - Markus

--=-XQF7o4yrFkt2NYEZ5/VK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Thu, 2016-02-18 at 15:19 +0000, Christopher Larson wrote:</div><blockquote type="cite"><div dir="ltr"><br><br><div class="gmail_quote"><div dir="ltr">On Thu, Feb 18, 2016 at 7:19 AM Markus Lehtonen &lt;<a href="mailto:markus.lehtonen@linux.intel.com">markus.lehtonen@linux.intel.com</a>&gt; wrote:<br></div><blockquote type="cite">Create config fragment if the user makes modifications to kernel config.<br>
User may change .config e.g. by directly editing it or by running the<br>
'do_menuconfig' bitbake task. Devtool generates one monolithic fragment<br>
by simply doing a diff between .config and .config.baseline files in the<br>
source directory.&nbsp; If either of these files is missing, the config<br>
fragment is not gerenrated or updated. The output is a file,<br>
'devtool-fragment.cfg' that gets added to SRC_URI in the recipe (as well<br>
as copied into the 'oe-local-files' directory if that is present in the<br>
source tree).<br>
<br>
${S}/.config will be a symlink to ${B}/.config. We need to do this as<br>
devtool is not able to access ${B} because ${B} is set in a .bbappend in<br>
the workspace layer which is not parsed by devtool itself.<br>
<br>
[YOCTO #8999]<br>
<br>
Signed-off-by: Markus Lehtonen &lt;<a href="mailto:markus.lehtonen@linux.intel.com" target="_blank">markus.lehtonen@linux.intel.com</a>&gt;<br></blockquote><div><br></div><div>If the devtool-fragment.cfg already exists, what's the behavior? Will it update it with both the old and new changes, or will it create a second fragment?</div></div></div>
</blockquote><div><br></div><div>Currently, it will update the existing fragment.</div><div>&nbsp; &nbsp;- Markus</div><div><br></div></body></html>

--=-XQF7o4yrFkt2NYEZ5/VK--
