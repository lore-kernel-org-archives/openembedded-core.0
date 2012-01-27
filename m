Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RqqTo-0005B9-PZ
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 19:24:56 +0100
Received: by obbuo9 with SMTP id uo9so2198416obb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 10:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=5NXVQIlT7Kp2a/WnGZQBTIhrFNRhbT62t1+t/Prl5j0=;
	b=Sc6kHUGf3qG1VSHJ0EW3SFQGJ/TXQ+5bGBn1lW0KLFH7fhzjO9jqa0TTpZYeAhSe+K
	rhx4x5oqvOz6PvQpfWgwGJ2RxdispqzziMGnaTdcGHZBWX4M+HOx0MYyaIKMfywIH6yv
	T+y4/W54jioJTX9dCxH8ubhabkjlBJuy0NdrY=
MIME-Version: 1.0
Received: by 10.182.11.41 with SMTP id n9mr7476278obb.24.1327688226924; Fri,
	27 Jan 2012 10:17:06 -0800 (PST)
Received: by 10.60.3.228 with HTTP; Fri, 27 Jan 2012 10:17:06 -0800 (PST)
Date: Fri, 27 Jan 2012 10:17:06 -0800
Message-ID: <CAGDS+nkex8qcbSWmCRbC846FZb=PVd3fTMoxttPEWhxg6AuMhg@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Avahi broken?
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
X-List-Received-Date: Fri, 27 Jan 2012 18:24:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

After a pull this morning I am getting:

ERROR: Nothing PROVIDES '"base-passwd'
ERROR: Required build target 'avahi' has no buildable providers.
Missing or unbuildable dependency chain was: ['avahi', '"base-passwd']

Note the extraneous double quote prepended to base-passwd

Anyone else see this?

I suspect it was introduced with the "useradd: Ensure dependencies are
only added for target recipes, not native or nativesdk" patch which
seems to have a missing close quote on the USERADDSETSCENEDEPS line.

Steve


