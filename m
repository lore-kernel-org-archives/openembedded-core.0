Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RYypx-0006c1-SG
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 12:41:57 +0100
Received: by faaa20 with SMTP id a20so636077faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 03:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=FGn8nUZkUHEts+OkBwJhXhAYz9sTqGOG+lmRDzK0wHg=;
	b=JRlitOVaip/gstpUJFdKopbBVrK6eRni+iDJojxUwXZ6PzqObJJEbZWZzcfwHxzvt8
	D/RU3ipmO0mUHhgUGDwd2Ekd9vpuDV7wZFbOKZglPm+H7Fk3My8TT8+TGolK1oWCnvdL
	CmTov8DqCVStKWck1JeKdIDoyvRs/AM9ociBg=
MIME-Version: 1.0
Received: by 10.180.98.138 with SMTP id ei10mr224596wib.52.1323430506263; Fri,
	09 Dec 2011 03:35:06 -0800 (PST)
Received: by 10.223.69.133 with HTTP; Fri, 9 Dec 2011 03:35:05 -0800 (PST)
In-Reply-To: <CAJG6M_OAw=jfmJJzAc98_XSbcX8ki29Oz1G6zhk+3hSkQXSwdw@mail.gmail.com>
References: <CAGiJk9dH=1aV-YFkcr8aAkNsMq+dM4625FuOJHF_et4bYBPA+A@mail.gmail.com>
	<528C3B90-90CF-48F7-AD32-0200B1F16F82@dominion.thruhere.net>
	<CAGiJk9e1hij=EsWo8=nTmZxNjvptXMGjFRumKSJ3mKYf6-t3QA@mail.gmail.com>
	<CAJG6M_OAw=jfmJJzAc98_XSbcX8ki29Oz1G6zhk+3hSkQXSwdw@mail.gmail.com>
Date: Fri, 9 Dec 2011 12:35:05 +0100
Message-ID: <CAGiJk9c-Mw7ip+RbJCU9pupBoV+O5A0rE9kXH9OTynPPsygWHg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: On-screen- / virtual-keyboard
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
X-List-Received-Date: Fri, 09 Dec 2011 11:41:57 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

2011/12/4 Yury Bushmelev <jay4mail@gmail.com>:
[snip]
>
> My list of virtual keyboards includes also:
> * xvkbd http://homepage3.nifty.com/tsato/xvkbd/
> * qvkeyboard http://qt-apps.org/content/show.php/QVKeyboard?content=77983
> * Florence http://florence.sourceforge.net/english.html

I've made a recipe for Florence, and run tested it with xfce-nm-image
on an overo gumstix.
It works with some issues but they are gconf related (more info in the
coming patch).

Now the question to the layer maintainers is,
do you want the recipe in openembedded-core or meta-openembedded?

> * GTKeyboard http://www.gnu.org/software/gtkeyboard/gtkeyboard.html
> * Literki http://wiki.openmoko.org/wiki/Literki
>
> And "hybrid" input methods:
> * Dasher http://www.inference.phy.cam.ac.uk/dasher/
This is a very interesting concept,
as a technology enthusiast I see an use-case for writing text via
alternative input methods like eye tracking or Microsoft Kinect.

> * QWO http://www.nongnu.org/qwo/
>
> --
> Yury Bushmelev
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Regards
Samuel


