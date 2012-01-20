Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ro85i-0003C9-OJ
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 07:36:50 +0100
Received: by lags15 with SMTP id s15so121523lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 22:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=SoB6SxaACKGnMT9hX9uf5P8gyKWFY0LX9K+/M0m575Q=;
	b=XfHYmLxyVAShPbCIOjHJkIrmKmFkfU/EFHL3vpzz1mW+jpgrGTZFVPDvujAsQGB3KS
	NHezFU54xiXxia4Q7GVWw47Jpr/1XzC/tc5ummlZDpMlli+PxLPuJnscY2VqBMpjRI2D
	hUqUtCrOAUiq2kH1iAQzM2AoZ6jA4qXB07MTA=
Received: by 10.152.125.162 with SMTP id mr2mr14572557lab.24.1327040950287;
	Thu, 19 Jan 2012 22:29:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.22.233 with HTTP; Thu, 19 Jan 2012 22:28:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jan 2012 22:28:39 -0800
Message-ID: <CAMKF1sqGt0FTbnhpuP9HCeJ6LpqJrRs8GVB6azdPGfcvYHSJSQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: adding tools-debug to EXTRA_IMAGE_FEATURES pulls other tasks from same recipe
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
X-List-Received-Date: Fri, 20 Jan 2012 06:36:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I added to local.conf
EXTRA_IMAGE_FEATURES += "tools-debug"

and now when I do bitbake -g I see that its wanting to build
"tools-testapp" and "tools-profile"
even though I did not ask them to be added to my image. all these
packages are coming from
single recipe task-core-tools.bb. If I divide this recipe into 3
different recipes where each provides
just one task, it then leaves the others out.

Since these are meta packages they pull in a lot of stuff. Would it be
ok to divide this recipe
into 3 individual recipes ? Ideally I would expect that the other
packages dont get build even
though they are in same recipe but that is not the case at present

Thoughts?
-Khem


