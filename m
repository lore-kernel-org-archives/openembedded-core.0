Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RAgMk-0001Kg-2o
	for openembedded-core@openembedded.org; Mon, 03 Oct 2011 13:07:22 +0200
Received: by vwe42 with SMTP id 42so2797300vwe.6
	for <openembedded-core@openembedded.org>;
	Mon, 03 Oct 2011 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=B2WEdL5qL+yBIb2X7ElMcpUi+mysumJnw7zfk0Bi/vM=;
	b=GjlB0F3yseXq4aSwKCFL86whkMQ+D8vJxR52t0XTX/KKwWJyw2ZetmDH9icwKFtZlB
	z/Che3npxkfMCHXQE6Xp/p2FWuk+Z/2i51EWJ5/anerhQJwKsHs3D0n/NsIjJnAjKIgF
	sNOLocbMyrVWgna6fegN6DyUh+MvMU/O+bc0w=
MIME-Version: 1.0
Received: by 10.52.94.112 with SMTP id db16mr13563903vdb.497.1317639709315;
	Mon, 03 Oct 2011 04:01:49 -0700 (PDT)
Received: by 10.52.181.226 with HTTP; Mon, 3 Oct 2011 04:01:49 -0700 (PDT)
Date: Mon, 3 Oct 2011 15:01:49 +0400
Message-ID: <CALT56yPSLXF13FjunSPOYtMHNpgaXD1zQuHicmhiowR1rSGeow@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core <openembedded-core@openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: oe-core/meta-oe PN clash
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
X-List-Received-Date: Mon, 03 Oct 2011 11:07:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I've stumbled upon two different packages with same PN (screenshot):
One is a sato-related screenshoter from oe-core,
second is a e17 screenshot module from meta-efl.

I'd propose to rename a sato screenshot package, since e17 one
depends on PN being equal to internal module name in several places.

-- 
With best wishes
Dmitry


