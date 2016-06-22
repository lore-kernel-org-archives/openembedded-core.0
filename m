Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E63CF601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 10:11:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jun 2016 03:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; 
	d="scan'208,217";a="981023532"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 22 Jun 2016 03:11:16 -0700
Message-ID: <1466590275.6738.4.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 13:11:15 +0300
In-Reply-To: <524a1de66f35c2ecce1a709da93bfa65@technux.se>
References: <1458665220-26223-1-git-send-email-markus.lehtonen@linux.intel.com>
	<E7380AB9-2F38-424E-BF79-E60ECCF611D2@linux.intel.com>
	<524a1de66f35c2ecce1a709da93bfa65@technux.se>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCH v3] base.bbclass wipe ${S} before unpacking source
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
X-List-Received-Date: Wed, 22 Jun 2016 10:11:17 -0000
Content-Type: multipart/alternative; boundary="=-VWq95vDSGRXrHoHAFGBS"

--=-VWq95vDSGRXrHoHAFGBS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Ping! This hasn't been merged, yet I haven't seen any further comments.
  - Markus
On Wed, 2016-05-11 at 06:34 +0200, Petter Mabäcker wrote:
> Hi Markus, 
> 
> From my point of view it looks good, and all feedback from v2 of the
> patch seems to have been handled as well. 
> 
> BR Petter
> 
> Petter Mabäcker
> 
> Technux <petter@technux.se>
> www.technux.se
> 2016-05-10 09:56 skrev Markus Lehtonen:
> > Ping,
> > 
> > Any comments on this one?
> > 
> > Discussion on v2 of the patch:
> > http://lists.openembedded.org/pipermail/openembedded-core/2016-Marc
> > h/119295.html
> > 
> > Cheers,
> >   Markus
> > 
> > 
> > 
> > On 22/03/16 18:47, "Markus Lehtonen" <
> > openembedded-core-bounces@lists.openembedded.org on behalf of 
> > markus.lehtonen@linux.intel.com> wrote:
> > > Make sure that we have a pristine source tree after do_unpack.
> > > [YOCTO #9064] Signed-off-by: Markus Lehtonen
> > >  --- meta/classes/base.bbclass |
> > > 12 ++---------- 1 file changed, 2 insertions(+), 10 deletions(-)
> > > diff --git a/meta/classes/base.bbclass
> > > b/meta/classes/base.bbclass index e066dc9..2acb2b6 100644 ---
> > > a/meta/classes/base.bbclass +++ b/meta/classes/base.bbclass @@ 
> > > -133,23 +133,15 @@ python base_do_fetch() { addtask unpack after
> > > do_fetch do_unpack[dirs] = "${WORKDIR}" +do_unpack[cleandirs] =
> > > "${@d.getVar('S', True) if d.getVar('S', True) !=
> > > d.getVar('WORKDIR', True) else os.path.join(d.getVar('S', True),
> > > 'patches')}" python base_do_unpack() { src_uri =
> > > (d.getVar('SRC_URI', True) or "").split() if len(src_uri) == 0:
> > > return - rootdir = d.getVar('WORKDIR', True) - - # Ensure that we
> > > cleanup ${S}/patches - # TODO: Investigate if we can remove - #
> > > the entire ${S} in this case. - s_dir = d.getVar('S', True) -
> > > p_dir = os.path.join(s_dir, 'patches') - bb.utils.remove(p_dir,
> > > True) - try: fetcher = bb.fetch2.Fetch(src_uri, d) -
> > > fetcher.unpack(rootdir) + fetcher.unpack(d.getVar('WORKDIR',
> > > True)) except bb.fetch2.BBFetchException as e: raise
> > > bb.build.FuncFailed(e) } -- 2.6.2 --
> > > _______________________________________________ Openembedded-core
> > > mailing list Openembedded-core@lists.openembedded.org 
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=-VWq95vDSGRXrHoHAFGBS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>Ping! This hasn't been merged, yet I haven't =
seen any further comments.</div><div>&nbsp; - Markus</div><div><br></div><d=
iv><br></div><div>On Wed, 2016-05-11 at 06:34 +0200, Petter Mab=C3=A4cker w=
rote:</div><blockquote type=3D"cite">
<pre>Hi Markus,=20

=46rom my point of view it looks good, and all feedback from v2 of the patch =
seems to have been handled as well.=20

BR Petter<br><br></pre>
<pre>Petter Mab=C3=A4cker

Technux &lt;petter@technux.se&gt;
www.technux.se</pre>
<p>2016-05-10 09:56 skrev Markus Lehtonen:</p>
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%"><!-- html ignored --><!-- head ignore=
d --><!-- meta ignored -->
<pre>Ping,

Any comments on this one?

Discussion on v2 of the patch:
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2016-M=
arch/119295.html">http://lists.openembedded.org/pipermail/openembedded-core=
/2016-March/119295.html</a>

Cheers,
  Markus



On 22/03/16 18:47, "Markus Lehtonen" &lt;<a href=3D"mailto:openembedded-cor=
e-bounces@lists.openembedded.org">openembedded-core-bounces@lists.openembed=
ded.org</a> on behalf of <a href=3D"mailto:markus.lehtonen@linux.intel.com"=
>markus.lehtonen@linux.intel.com</a>&gt; wrote:</pre>
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%">Make sure that we have a pristine sou=
rce tree after do_unpack. [YOCTO #9064] Signed-off-by: Markus Lehtonen &lt;=
<a href=3D"mailto:markus.lehtonen@linux.intel.com">markus.lehtonen@linux.in=
tel.com</a>&gt; --- meta/classes/base.bbclass | 12 ++---------- 1 file chan=
ged, 2 insertions(+), 10 deletions(-) diff --git a/meta/classes/base.bbclas=
s b/meta/classes/base.bbclass index e066dc9..2acb2b6 100644 --- a/meta/clas=
ses/base.bbclass +++ b/meta/classes/base.bbclass @@ -133,23 +133,15 @@ pyth=
on base_do_fetch() { addtask unpack after do_fetch do_unpack[dirs] =3D "${W=
ORKDIR}" +do_unpack[cleandirs] =3D "<a href=3D"mailto:${@d.getVar">${@d.get=
Var</a>('S', True) if d.getVar('S', True) !=3D d.getVar('WORKDIR', True) el=
se os.path.join(d.getVar('S', True), 'patches')}" python base_do_unpack() {=
 src_uri =3D (d.getVar('SRC_URI', True) or "").split() if len(src_uri) =3D=
=3D 0: return - rootdir =3D d.getVar('WORKDIR', True) - - # Ensure that we =
cleanup ${S}/patches - # TODO: Investigate if we can remove - # the entire =
${S} in this case. - s_dir =3D d.getVar('S', True) - p_dir =3D os.path.join=
(s_dir, 'patches') - bb.utils.remove(p_dir, True) - try: fetcher =3D bb.fet=
ch2.Fetch(src_uri, d) - fetcher.unpack(rootdir) + fetcher.unpack(d.getVar('=
WORKDIR', True)) except bb.fetch2.BBFetchException as e: raise bb.build.Fun=
cFailed(e) } -- 2.6.2 <span class=3D"sig">-- ______________________________=
_________________ Openembedded-core mailing list <a href=3D"mailto:Openembe=
dded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org<=
/a> <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-=
core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a> =
</span></blockquote>
</blockquote>

<pre>--=20
_______________________________________________
Openembedded-core mailing list
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre></blockquote><div><br></div></body></html>

--=-VWq95vDSGRXrHoHAFGBS--
