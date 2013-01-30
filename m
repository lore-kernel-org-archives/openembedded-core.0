Received: from mail-qe0-f43.google.com ([209.85.128.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1U0eLP-0005dv-L3
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 21:33:20 +0100
Received: by mail-qe0-f43.google.com with SMTP id 3so382345qeb.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 12:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=RqzSMswC4B03GjyGZ5Qzfw3NoucTzUjIS1QvifyREQE=;
	b=Iy67Ns9gdT4yM0iCj8mqYa8ay35KljprV0lzq2v3KVp/ad4RhYHhVl9WUhTpjiEk3Q
	LpIGKCElUrVBFHrpQQoZUAwGucsxQNW5rWV3ZDJvTu9ony/buxalf6xt3lcX15PjrjO6
	sIhGB+gMHTIVb+JufcpX7+kI1p2qNOuut6rhRXYY5VCpkSICszEncS7ZZ6+J5oS6fBB0
	eSpRG92WCXMrLUprvNyVl6SFGan2iF3oYWXVlJuLJtO10TPI/YLuRAgrTFPdHHIvaO1m
	s7zgVZMOG2Uaj1rapoNVCBzizOLsbx5USt3gHdwH1FOUidbb9PFlAYlKZcp7aRlO9QkY
	NQsA==
MIME-Version: 1.0
X-Received: by 10.229.178.232 with SMTP id bn40mr1554871qcb.44.1359577057760; 
	Wed, 30 Jan 2013 12:17:37 -0800 (PST)
Received: by 10.49.106.5 with HTTP; Wed, 30 Jan 2013 12:17:37 -0800 (PST)
Date: Wed, 30 Jan 2013 22:17:37 +0200
Message-ID: <CADV-EXFEL738W0DJ89hHh3B9XwhvvZyW0SWt-w3owFBEWW2u=g@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Multiple systemd service packages for single recipe
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
X-List-Received-Date: Wed, 30 Jan 2013 20:33:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

How can I generate multiple systemd service packages for single recipe?

I'm building connman with VPN support and I want to have
connman-systemd and connman-vpn-systemd packages.
I'm using following syntax for connman recipe but no
"connman-vpn-systemd" is generated:

SYSTEMD_PACKAGES += "${PN}-systemd ${PN}-vpn-systemd"
SYSTEMD_SERVICE_${PN}-systemd = "connman.service"
SYSTEMD_SERVICE_${PN}-vpn-systemd = "connman-vpn.service"
FILES_${PN}-vpn-systemd +=
"${datadir}/dbus-1/system-services/net.connman.vpn.service"


