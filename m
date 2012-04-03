Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SEzDN-0002ZC-SE
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 10:35:45 +0200
Received: by wera1 with SMTP id a1so2150438wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2012 01:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Jikaf2ok8iNkVX9iJVuPD4CLLtr6ttf7UTFlFGIHcGU=;
	b=YeAIAmFS41ipiMwPTqMQizAnOvO+47MXPEXGF+Ep8kf5Ya41fO+4oOIphRl5PA/YDd
	WTmCbang39FB8rf+gC25ZLVNzOy6wxt0gmdGQ2ifByyWo04SGRNItrBqCVVdOZ4cTvh/
	fTPbVsMi3WkkeQMLQpnh7HOXX/apIn+1rgWGe+AEWYJqUFw9M50/FmaS++fcdvmBZw/x
	Bt88fnm6/9iDMp2dx8C9EOr70PeDfS4Rs8rJ8/5+wydwujNe5lxDnZOR/g/FpanIkdIV
	aj1ez+VrzBjcze/5+S86oYjYrFHVg8pE5c5hi9CSOoKQ9lJM/B07dswivZ8uI32SKYD9
	WDVg==
MIME-Version: 1.0
Received: by 10.180.102.100 with SMTP id fn4mr34175038wib.1.1333441596959;
	Tue, 03 Apr 2012 01:26:36 -0700 (PDT)
Received: by 10.223.89.83 with HTTP; Tue, 3 Apr 2012 01:26:36 -0700 (PDT)
Date: Tue, 3 Apr 2012 10:26:36 +0200
Message-ID: <CAGiJk9cA_NvrK9R_HrGFkTU853VBp3Ct3-j9nEQSZ00DTw2VLA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Odd behavior of docbook-xsl-native
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
X-List-Received-Date: Tue, 03 Apr 2012 08:35:46 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
I just noticed that building docbook-xsl-native appended the following
line to my user ~/.bashrc:
. /work/oe-core/tmp-eglibc/work/x86_64-linux/docbook-xsl-native-1.76.1-r0/docbook-xsl-1.76.1/.profile.incl

Has anyone else noticed this behavior?

-- 
Regards
Samuel


