Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TSGRJ-000418-Pf
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Oct 2012 02:09:17 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so5254883ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Oct 2012 16:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ckJ3OQndr/9Nl0YL7wL/IHiJBrOlFh784RFbc/Azg7U=;
	b=a4SP7tVZi/9y9/baJfvxVqiYsK87fCnTd35/6/Oy9mHrB/wSt/mzSbTLgk+yq5NbgX
	OjBxloMxjF7M77OUVONNEv7xmGgC4pFQQJ3RpG/OkGPgAPvKvtz2RZ64lbdQbhOuipFk
	yRm2WzF+aGEG1Q7joBtq9E9585lU69Ki7lnGxi7T6x51av4zXNpYJqzCAVPOHdPQkV0U
	bdZjmSa57f7nH46fVt/0md+Lu8tu1ZqyvG3fog/asMh0oa28C3vL146M1p5fyRb7K4Ji
	ajxUDhmQqZtAZSzEt/BW0YYBorbsFueomOtl6Y7wmfK69+/dKEqIb8ceyOWnRtY0kYVw
	hBTw==
MIME-Version: 1.0
Received: by 10.50.184.165 with SMTP id ev5mr5968628igc.32.1351382145216; Sat,
	27 Oct 2012 16:55:45 -0700 (PDT)
Received: by 10.64.99.226 with HTTP; Sat, 27 Oct 2012 16:55:45 -0700 (PDT)
Date: Sun, 28 Oct 2012 01:55:45 +0200
Message-ID: <CAAQYJAtxfQDkODhaPZP1Z8honP1azA1B6PuQ_DfjtuB--8YnvA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: devshell spawning twice
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
X-List-Received-Date: Sun, 28 Oct 2012 00:09:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Since commit c76da87511d2668479745c2f18b8a9b8116c7489 (terminal: Add
support for running custom terminals.) screen opens also in the master
terminal, waiting for input.

Reverting the patch fixes the funny behavior.

This on Gentoo, using xterm.

Regards

Andrea


