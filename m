Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id CC6DC6060F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 09:15:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id C97292610CE
Message-ID: <1506513314.13215.7.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0Lb3sAfd1Cs5gfoLD06_r62qPnxc+RcuqFDCFa9EWMJJtA@mail.gmail.com>
References: <20170922110243.10454-1-fabien.lahoudere@collabora.co.uk>
	<20170922110243.10454-2-fabien.lahoudere@collabora.co.uk>
	<CAJTo0LYMQ9NAvK+zNegmtbPQnPao1rx6wQM1q48TRP6FDUopHg@mail.gmail.com>
	<CAP9ODKp6tsZd34jS1QzDnEpi=0ALSs8GaHFPC9iVO-5wjkUD7A@mail.gmail.com>
	<CAJTo0La3fRSYaQAgWZt-qWB-noNsqvgO8Q2G4wYgqj62qB8Mug@mail.gmail.com>
	<1506467312.13215.1.camel@collabora.co.uk>
	<CAJTo0Lb3sAfd1Cs5gfoLD06_r62qPnxc+RcuqFDCFa9EWMJJtA@mail.gmail.com>
Date: Wed, 27 Sep 2017 13:55:14 +0200
Mime-Version: 1.0
X-Mailer: Evolution 3.22.6-1 
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 30 Sep 2017 09:15:19 -0000
Content-Type: multipart/alternative; boundary="=-qUFy1GCmg4egS0JbGdX7"

--=-qUFy1GCmg4egS0JbGdX7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-09-27 at 12:12 +0100, Burton, Ross wrote:
> On 27 September 2017 at 00:08, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk> wrote:
> > On Tue, 2017-09-26 at 20:16 +0100, Burton, Ross wrote:
> > > On 26 September 2017 at 19:04, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
> > > > On Tue, Sep 26, 2017 at 12:29 PM, Burton, Ross <ross.burton@intel.com> wrote:
> > > > 
> > > > > Does this depend on the upgrades, or should it work standalone?
> > > > 
> > > > 
> > > > 
> > > > This works standalone. I've been using it.
> > > 
> > > In which case I should report that when I applied it, building weston failed:
> > > 
> > > make: *** No rule to make target 'protocol/xdg-shell-unstable-v6-protocol.c', needed by
> > > 'all'.  Stop.
> > > 
> > 
> > This is because I test with weston patch (3/4) that drop line
> > "WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"
> 
> Bisectability is important, so reordering the patches so this patch is first and everything still
> builds followed by the upgrades would make both merging now (there was a chance that this patch
> would make 2.4) and later bisects easier.

Yes sure, I will send a new patch series in the afternoon.
Thanks
Fabien
> Ross 

--=-qUFy1GCmg4egS0JbGdX7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode:=
 space; -webkit-line-break: after-white-space;"><div>On Wed, 2017-09-27 at =
12:12 +0100, Burton, Ross wrote:</div><blockquote type=3D"cite"><div dir=3D=
"ltr">On 27 September 2017 at 00:08, Fabien Lahoudere <span dir=3D"ltr">&lt=
;<a href=3D"mailto:fabien.lahoudere@collabora.co.uk" target=3D"_blank">fabi=
en.lahoudere@collabora.co.uk</a>&gt;</span> wrote:<br><div class=3D"gmail_e=
xtra"><div class=3D"gmail_quote"><blockquote type=3D"cite"><div><span class=
=3D""><div>On Tue, 2017-09-26 at 20:16 +0100, Burton, Ross wrote:</div><blo=
ckquote type=3D"cite"><div dir=3D"ltr">On 26 September 2017 at 19:04, Otavi=
o Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystem=
s.com.br" target=3D"_blank">otavio.salvador@ossystems.<wbr>com.br</a>&gt;</=
span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><bloc=
kquote type=3D"cite"><span class=3D"m_-5589556574993032862gmail-">On Tue, S=
ep 26, 2017 at 12:29 PM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@int=
el.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; Does this depend on the upgrades, or should it work standalone?<br>
<br>
</span>This works standalone. I've been using it.<br></blockquote><div><br>=
</div><div>In which case I should report that when I applied it, building w=
eston failed:</div><div><br></div><div>make: *** No rule to make target 'pr=
otocol/xdg-shell-unstable-<wbr>v6-protocol.c', needed by 'all'.&nbsp; Stop.=
<br></div><div><br></div></div></div></div></blockquote><div><br></div></sp=
an><div>This is because I test with weston patch (3/4) that drop line "<spa=
n style=3D"font-family:monospace">WAYLAND_PROTOCOLS_SYSROOT_<wbr>DIR=3D${RE=
CIPE_SYSROOT}"</span></div></div><br></blockquote><div><br></div><div>Bisec=
tability is important, so reordering the patches so this patch is first and=
 everything still builds followed by the upgrades would make both merging n=
ow (there was a chance that this patch would make 2.4) and later bisects ea=
sier.</div></div></div></div></blockquote><div><br></div><div>Yes sure, I w=
ill send a new patch series in the afternoon.</div><div><br></div><div>Than=
ks</div><div><br></div><div>Fabien</div><div><br></div><blockquote type=3D"=
cite"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote=
"><div><br></div><div>Ross&nbsp;</div></div></div></div>
</blockquote></body></html>

--=-qUFy1GCmg4egS0JbGdX7--
