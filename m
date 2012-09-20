Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tarek.elsherbiny@gmail.com>) id 1TEhmP-00087X-Qv
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 16:31:01 +0200
Received: by qcad10 with SMTP id d10so1832712qca.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2012 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=7wtlEiisD2CY4/6Go7syIPYdEk+Se6CPcdjYkNTPho4=;
	b=zDp9dmx2OZIcJ2l3QHpUIEm6CTUzt83U6PZKq+ZPP+NDJ1M9SfwJzAxIejXMI5cj8U
	H6LPjmGjDs7naPoqoJTNdcyqcwzR++XHLMx+zRatAgY+LOAnUKkvWgp1TLMRZHnW+s0f
	lnPf3jkj66l8rqbKESFto0lBie//jAZU48gn3DjsZOO4Uq+cXFZzTuRCuJOSSz3GVA1y
	is+G1iWjzUVDXpAOIJdQrm7cmD7hTvGzF4pZXyUKv8lAt1SixGeZubb3yZjCKtCGIirR
	724itKFu5793vbJdF85mdypsMT9cQbYb5dCUvWq4QBfOWyzqoICJ/yRb/0bosKaUIpvN
	Tn9w==
MIME-Version: 1.0
Received: by 10.224.206.198 with SMTP id fv6mr4959599qab.65.1348150698709;
	Thu, 20 Sep 2012 07:18:18 -0700 (PDT)
Received: by 10.224.174.19 with HTTP; Thu, 20 Sep 2012 07:18:18 -0700 (PDT)
Date: Thu, 20 Sep 2012 15:18:18 +0100
Message-ID: <CAB3sqtYcKxt3R4phift55_gbNZU7iUoiAdXJRQ_bZmeivSNR_Q@mail.gmail.com>
From: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: SVN fetch is not working
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
X-List-Received-Date: Thu, 20 Sep 2012 14:31:02 -0000
Content-Type: multipart/alternative; boundary=20cf300fb2db80131e04ca22cbe6

--20cf300fb2db80131e04ca22cbe6
Content-Type: text/plain; charset=ISO-8859-1

Hi,

This is the line i'm using to fetch from local svn server

SRC_URI =
"svn://svn.ad-group.adh/svn/dev_repos/Generation3_app;module=trunk;proto=http"

Viewing the log.do_fetch file:

DEBUG: Fetcher accessed the network with the command /usr/bin/env svn info
http://svn.ad-group.adh/svn/dev_repos/Generation3_app/trunk/
DEBUG: Running export HOME="/home/telsherbiny"; export
SSH_AGENT_PID="2398"; export SSH_AUTH_SOCK="/tmp/keyring-suRHPa/ssh";
export
........
........
/work/fsl/sources/poky/scripts"; LANG=C LC_ALL=C /usr/bin/env *svn info
http://svn.ad-group.adh/svn/dev_repos/Generation3_app/trunk*/

DEBUG: Trying PREMIRRORS
DEBUG: For url ['svn', 'svn.ad-group.adh',
'/svn/dev_repos/Generation3_app', '', '', {'module': 'trunk', 'proto':
'http'}] comparing ['bzr', '.*', '/.
*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
'/mirror/sources/', '', '', {}]
.................
.................

So bitbake is constructing the svn command correctly but it fall-back to
Mirrors for some reason!

When I run the same svn command manually I get the correct result.

Can someone explain why it's not working?

The same recipe is working for oe-classic!

Thanks

--20cf300fb2db80131e04ca22cbe6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>This is the line i&#39;m using to fetch from local s=
vn server</div><div><br></div><div>SRC_URI =3D &quot;svn://svn.ad-group.adh=
/svn/dev_repos/Generation3_app;module=3Dtrunk;proto=3Dhttp&quot;</div><div>=
<br>
</div><div>Viewing the log.do_fetch file:</div><div><br></div><div><div>DEB=
UG: Fetcher accessed the network with the command /usr/bin/env svn info =A0=
<a href=3D"http://svn.ad-group.adh/svn/dev_repos/Generation3_app/trunk/">ht=
tp://svn.ad-group.adh/svn/dev_repos/Generation3_app/trunk/</a></div>
<div>DEBUG: Running export HOME=3D&quot;/home/telsherbiny&quot;; export SSH=
_AGENT_PID=3D&quot;2398&quot;; export SSH_AUTH_SOCK=3D&quot;/tmp/keyring-su=
RHPa/ssh&quot;; export=A0</div><div>........</div><div>........</div><div>/=
work/fsl/sources/poky/scripts&quot;; LANG=3DC LC_ALL=3DC /usr/bin/env <b><f=
ont color=3D"#3333ff">svn info =A0<a href=3D"http://svn.ad-group.adh/svn/de=
v_repos/Generation3_app/trunk">http://svn.ad-group.adh/svn/dev_repos/Genera=
tion3_app/trunk</a></font></b>/</div>
</div><div><br></div><div><div>DEBUG: Trying PREMIRRORS</div><div>DEBUG: Fo=
r url [&#39;svn&#39;, &#39;svn.ad-group.adh&#39;, &#39;/svn/dev_repos/Gener=
ation3_app&#39;, &#39;&#39;, &#39;&#39;, {&#39;module&#39;: &#39;trunk&#39;=
, &#39;proto&#39;: &#39;http&#39;}] comparing [&#39;bzr&#39;, &#39;.*&#39;,=
 &#39;/.</div>
<div>*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;, &#39;<a href=
=3D"http://downloads.yoctoproject.org">downloads.yoctoproject.org</a>&#39;,=
 &#39;/mirror/sources/&#39;, &#39;&#39;, &#39;&#39;, {}]</div><div>........=
.........</div>
</div><div>.................</div><div><br></div><div>So bitbake is constru=
cting the svn command correctly but it=A0fall-back to Mirrors for some reas=
on!</div><div>=A0</div><div>When I run the same svn command manually I get =
the correct result.</div>
<div><br></div><div>Can someone explain why it&#39;s not working?=A0</div><=
div><br></div><div>The same recipe is working for oe-classic!</div><div><br=
></div><div>Thanks=A0</div>

--20cf300fb2db80131e04ca22cbe6--
