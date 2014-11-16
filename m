Return-Path: <dev@michaeljones.de>
X-Greylist: delayed 399 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 16 Nov 2014 22:19:07 UTC
Received: from gproxy5-pub.mail.unifiedlayer.com
	(gproxy5-pub.mail.unifiedlayer.com [67.222.38.55])
	by mail.openembedded.org (Postfix) with SMTP id 4D2987211F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Nov 2014 22:19:07 +0000 (UTC)
Received: (qmail 29792 invoked by uid 0); 16 Nov 2014 22:12:27 -0000
Received: from unknown (HELO cmgw3) (10.0.90.84)
	by gproxy5.mail.unifiedlayer.com with SMTP; 16 Nov 2014 22:12:27 -0000
Received: from box344.bluehost.com ([69.89.31.144]) by cmgw3 with 
	id GNCP1p00D36aKKZ01NCSG1; Sun, 16 Nov 2014 15:12:27 -0700
X-Authority-Analysis: v=2.1 cv=W++rC3mk c=1 sm=1 tr=0
	a=/3MHyB2dqdLLxvyrN6hMug==:117 a=/3MHyB2dqdLLxvyrN6hMug==:17
	a=cNaOj0WVAAAA:8
	a=f5113yIGAAAA:8 a=pBujmknCgrIA:10 a=8nJEP1OIZ-IA:10 a=MjMJZFfgxmYA:10
	a=monjPXICw38A:10 a=uC7lKsYNmQum8SxENY8A:9 a=wPNLvfGTeEIA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=michaeljones.de; s=default; 
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID;
	bh=/Pzw7tU3zgX7g9RlvdxGltf/habTeSvOlWuO5KjrvYI=; 
	b=V1gzopZtA+wNdwNLqwexHurct3VnkSNMdMVJ5uxpaK4q45/dPtZ21k6HgZVQyLCemomolwC9I/godPqUqYpjnKD2pUISR7rgU3ffp/peK5bxNsVGszs6iZaPOaRo+6Op;
Received: from [94.217.139.41] (port=54802 helo=localhost.localdomain)
	by box344.bluehost.com with esmtpsa (TLSv1:DHE-RSA-AES128-SHA:128)
	(Exim 4.82) (envelope-from <dev@michaeljones.de>) id 1Xq83T-0000O2-6M
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Nov 2014 15:12:23 -0700
Message-ID: <54692143.7040107@michaeljones.de>
Date: Sun, 16 Nov 2014 23:12:19 +0100
From: Michael <dev@michaeljones.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Identified-User: {2060:box344.bluehost.com:hapnensc:michaeljones.de}
	{sentby:smtp auth 94.217.139.41 authed with
	dev@michaeljones.de}
Subject: read-only-rootfs support for systemd
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
X-List-Received-Date: Sun, 16 Nov 2014 22:19:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I noticed that support for "read-only-rootfs" in IMAGE_FEATURES is 
currently limited to using sysvinit.

Are there any efforts already underway to add support for 
read-only-rootfs for systemd?  Aren't there already OpenEmbedded users 
out there generating read-only root filesystems with systemd, or is this 
somehow obscure?  Is anyone aware of technical landmines toward pursuing 
this that I should be aware of?

Also, I would like this restriction to have been mentioned in the Yocto 
Project Development Manual where the feature is mentioned.  How/where 
does one make a suggestion for an improvement in this documentation?

thanks,
Michael

