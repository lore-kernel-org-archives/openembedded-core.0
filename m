Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Alexey_Firago@mentor.com>) id 1StINL-00052A-L2
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 15:08:40 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1StICF-0001Id-Aa from Alexey_Firago@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 05:57:11 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 23 Jul 2012 05:57:10 -0700
Received: from [137.202.140.163] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.1.289.1; Mon, 23 Jul 2012 13:57:08 +0100
Message-ID: <500D4A2B.5070703@mentor.com>
Date: Mon, 23 Jul 2012 16:57:15 +0400
From: Firago Alexey <Alexey_Firago@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.4) Gecko/20120510 Icedove/10.0.4
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 23 Jul 2012 12:57:10.0254 (UTC)
	FILETIME=[AC0C98E0:01CD68D2]
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Mon, 23 Jul 2012 13:08:40 -0000
Content-Type: multipart/alternative;
	boundary="------------060503040704020406080308"

--------------060503040704020406080308
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 6/15/2012 8:15 AM, Joe MacDonald wrote:
> We've been talking about this on-and-off at Wind River for a while now,
> but it now seems like a reasonable time to bring a proposal to the OE
> community at large.  We're thinking about creating a new layer to house
> recipes, etc.  for networking packages.
> ...
> So what does everyone think?  Awesome idea?  Terrible idea?  (Hopefully)
> something in between?  All feedback is welcome.

I think creating software support layer for network related packages is 
good idea.
We've updated some of the recipes from OE Classic mentioned above for 
our projects at Mentor Graphics.
We've been thinking to place these updated recipes in meta-oe layer. But 
I think now that separate layer like meta-networking
would be much more suitable place.  Also we've created some new packages 
like mipv6-umip or multipath-tools
that are good candidates for being placed in meta-networking.

So, I suggest Mentor Graphics would contribute to meta-networking.

--
Alexey Firago**|Software Engineer, Embedded Systems Division, Mentor 
Graphics

--------------060503040704020406080308
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi all,<br>
    <br>
    On 6/15/2012 8:15 AM, Joe MacDonald wrote:<br>
    <blockquote type="cite">We've been talking about this on-and-off at
      Wind River for a while now,<br>
      but it now seems like a reasonable time to bring a proposal to the
      OE<br>
      community at large.&nbsp; We're thinking about creating a new layer to
      house<br>
      recipes, etc.&nbsp; for networking packages.</blockquote>
    <blockquote type="cite">...</blockquote>
    <blockquote type="cite">So what does everyone think?&nbsp; Awesome idea?&nbsp;
      Terrible idea?&nbsp; (Hopefully)<br>
      something in between?&nbsp; All feedback is welcome.<br>
    </blockquote>
    <br>
    I think creating software support layer for network related packages
    is good idea.
    <br>
    We've updated some of the recipes from OE Classic mentioned above
    for our projects at Mentor Graphics.
    <br>
    We've been thinking to place these updated recipes in meta-oe layer.
    But I think now that separate layer like meta-networking <br>
    would be much more suitable place.&nbsp;
    Also we've created some new packages like mipv6-umip or
    multipath-tools <br>
    that are good candidates for being placed in meta-networking.
    <br>
    &nbsp;<br>
    So, I suggest Mentor Graphics would contribute to meta-networking.<br>
    <br>
    --<br>
    Alexey Firago<b><span style="font-size:10.0pt;color:black"></span></b><span
      style="font-size:10.0pt;color:#595959">|</span>Software Engineer,
    Embedded Systems Division, Mentor Graphics
  </body>
</html>

--------------060503040704020406080308--
