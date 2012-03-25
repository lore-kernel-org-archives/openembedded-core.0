Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mikew@criticallink.com>) id 1SBpsP-0002Pa-T0
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 18:01:06 +0200
Received: by qatm19 with SMTP id m19so1958789qat.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 08:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=wvG8qR2+U54qonWZ94qjuomjavpxMhhnqIZbwhlM8I0=;
	b=ItJW7eTnmrVctiDRr457ys7JGvdLPGlVUcJ5D68yJRlqoqyHdH88HY6VGzZu0XZGeM
	G4dLcyfCqYwc8t9OgBJmXQh5xzQqxV5w4azlMO2rvWd8XbkbQStu0kC96+RFAD/dzytg
	jIF5VcOCbAFVknH1DXC7fTgyWpSzHH8PDwjSXdwFBge0+8C6hwXcWSm+5f7OZhy2CBzQ
	wd5kscJjJqkOKKdmNNhQfyRjKwJcY6Upl61IqIFY93ZnNouKwwyILB1QVn6qfZyR7kOj
	y0IicaHML+kG6EXfY/rapN1rcvVRy9vSbF4RyZ9YuY1+zuw9gLTPbtpHzuPh30Fy+ObP
	o2Gg==
Received: by 10.229.136.130 with SMTP id r2mr6978113qct.58.1332690726584; Sun,
	25 Mar 2012 08:52:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.32.68 with HTTP; Sun, 25 Mar 2012 08:51:46 -0700 (PDT)
From: Mike Williamson <michael.williamson@criticallink.com>
Date: Sun, 25 Mar 2012 11:51:46 -0400
Message-ID: <CAHEoWwvDxL4YCD=NNy=wVfWS+xMcSnQDG43Bftrg1jqzpYd5Tw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQmpMcAN0myFibz8MfDc7MoDH+tBacE38zHnOCFZ0O0KDdLDX4jox7zp0F2/qPE7HvoQWg0h
Cc: mac@mcrowe.com
Subject: libtool-cross patch thread : follow up on do_install...
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
X-List-Received-Date: Sun, 25 Mar 2012 16:01:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I was investigating a build issue using a local recipe inheriting autotools
employing libtool (a compile of unixodbc, needed by the new php recipe)
and ran into an issue that appears to be solved by=C2=A0modifying the
do_install() method of libtool-cross according to comments made
in this patch thread:

http://patches.openembedded.org/patch/15065/

Basically, replace the do_install with "oe_runmake DESTDIR=3D${D} install"
suggested by Khem Raj.   Mike Crowe seemed to think that it cleaned
up issues he was having, but the thread seems to die at that point.

The current recipe for libtool-cross does not reflect the modification
mentioned, so I am wondering if this is not appropriate?
Am I doing more harm than good?

Thanks.

-Mike


