Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 59A5D71A72
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 23:08:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id 73026268699
Message-ID: <1506467312.13215.1.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: "Burton, Ross" <ross.burton@intel.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Date: Wed, 27 Sep 2017 01:08:32 +0200
In-Reply-To: <CAJTo0La3fRSYaQAgWZt-qWB-noNsqvgO8Q2G4wYgqj62qB8Mug@mail.gmail.com>
References: <20170922110243.10454-1-fabien.lahoudere@collabora.co.uk>
	<20170922110243.10454-2-fabien.lahoudere@collabora.co.uk>
	<CAJTo0LYMQ9NAvK+zNegmtbPQnPao1rx6wQM1q48TRP6FDUopHg@mail.gmail.com>
	<CAP9ODKp6tsZd34jS1QzDnEpi=0ALSs8GaHFPC9iVO-5wjkUD7A@mail.gmail.com>
	<CAJTo0La3fRSYaQAgWZt-qWB-noNsqvgO8Q2G4wYgqj62qB8Mug@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/4] wayland-protocols: Fix installation patch issue
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
X-List-Received-Date: Tue, 26 Sep 2017 23:08:35 -0000
Content-Type: multipart/alternative; boundary="=-/T3+kCSXMPyECv1luLc4"

--=-/T3+kCSXMPyECv1luLc4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-09-26 at 20:16 +0100, Burton, Ross wrote:
> On 26 September 2017 at 19:04, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
> > On Tue, Sep 26, 2017 at 12:29 PM, Burton, Ross <ross.burton@intel.com> wrote:
> > 
> > > Does this depend on the upgrades, or should it work standalone?
> > 
> > 
> > 
> > This works standalone. I've been using it.
> 
> In which case I should report that when I applied it, building weston failed:
> 
> make: *** No rule to make target 'protocol/xdg-shell-unstable-v6-protocol.c', needed by 'all'. 
> Stop.
> 

This is because I test with weston patch (3/4) that drop line
"WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"
> Ross
>  

--=-/T3+kCSXMPyECv1luLc4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Tue, 2017-09-26 at 20:16 +0100, Burton, Ross wrote:</div><blockquote type="cite"><div dir="ltr">On 26 September 2017 at 19:04, Otavio Salvador <span dir="ltr">&lt;<a href="mailto:otavio.salvador@ossystems.com.br" target="_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div class="gmail_extra"><div class="gmail_quote"><blockquote type="cite"><span class="gmail-">On Tue, Sep 26, 2017 at 12:29 PM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; Does this depend on the upgrades, or should it work standalone?<br>
<br>
</span>This works standalone. I've been using it.<br></blockquote><div><br></div><div>In which case I should report that when I applied it, building weston failed:</div><div><br></div><div>make: *** No rule to make target 'protocol/xdg-shell-unstable-v6-protocol.c', needed by 'all'.&nbsp; Stop.<br></div><div><br></div></div></div></div></blockquote><div><br></div><div>This is because I test with weston patch (3/4) that drop line "<span style="font-family: monospace;">WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"</span></div><div><br></div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra"><div class="gmail_quote"><div><br></div><div>Ross</div><div>&nbsp;</div></div></div></div>
</blockquote></body></html>

--=-/T3+kCSXMPyECv1luLc4--
