Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <erik.boto@pelagicore.com>) id 1UBMTh-0000ki-DW
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 10:42:10 +0100
Received: by mail-oa0-f44.google.com with SMTP id h1so5319358oag.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 01:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=lWRkBHCsTnM1NFf0wYqONKbCDk/+Vm9MsQ0SgWqDyPE=;
	b=EElnM8WCu1flaB3jvKUndMPsPnasrO3yjDJCc4kwfAGl/jOlUqMVeWqE5GwZInVGNC
	O0PjMSHMGydI7EgdVAjY7XcBb3d6RY7Z/gvvHi0yvCHXyn0Z2n15mnk94Zs3eEDSW62b
	Xn3MlG0nRZHVtf+3oJLhZmFsNu3ETogkCKl00DOlHCEghnHfFfF7HFvQm30PqVuc7+zP
	oM9ZHHimge2/dWnDkUIDIaTJ3JLw0kYYmq89GGFVNOHs4vVZcly2NYIzfNCMKXh+rQvS
	8aEyJ8tZnqP1du8yXak+aIhztIICp5nNaZUuHgspJqbZlBlQl2S5j60Z28qGHdvWNlv2
	03Ag==
MIME-Version: 1.0
X-Received: by 10.60.171.6 with SMTP id aq6mr8295142oec.43.1362129945738; Fri,
	01 Mar 2013 01:25:45 -0800 (PST)
Received: by 10.76.168.233 with HTTP; Fri, 1 Mar 2013 01:25:45 -0800 (PST)
Date: Fri, 1 Mar 2013 10:25:45 +0100
Message-ID: <CA+AhUGyTXD1cBArSo82+JnSrs6KKLw0O9U78U215-RJmFbhOeg@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQn2ZW3kdDAIaq5MI5JudOPctlv28AjjpOBtb0gHHLvBE3v3fHTIiT8AKUGf24uPkeeFH/Eh
Subject: systemd-systemctl-native not pulled in when building systemd image
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
X-List-Received-Date: Fri, 01 Mar 2013 09:42:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm building a small image with systemd as DISTRO_FEATURES_INITMAN and
it's also in DISTRO_FEATURES. But checking the log.do_rootfs I see
that systemctl is missing when running the postinst script of e.g.
systemd-compat-units.

If I put in DEPENDS += " systemd-systemctl-native" in my image recipe
it  works well, but it feels like this should be handled automatically
somehow.

The systemd.class has an anonymous python function for adding a
dependency to systemd-systemctl-native if it's in DISTRO_FEATURES, but
I guess this doesn't help during image builds?

Best Regards,
Erik


