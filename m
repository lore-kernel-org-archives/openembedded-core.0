Received: from mail1.bemta8.messagelabs.com ([216.82.243.202])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Javier.Viguera@digi.com>) id 1UePt8-0005nJ-DS
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 15:12:35 +0200
Received: from [216.82.241.196:23457] by server-10.bemta-8.messagelabs.com id
	1C/25-02860-07B1A915; Mon, 20 May 2013 12:47:44 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-6.tower-46.messagelabs.com!1369054062!30834997!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.8.6.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8009 invoked from network); 20 May 2013 12:47:42 -0000
Received: from mail.mx1.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-6.tower-46.messagelabs.com with RC4-SHA encrypted SMTP;
	20 May 2013 12:47:42 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.298.1;
	Mon, 20 May 2013 07:47:52 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.298.1; Mon, 20 May 2013 07:47:41 -0500
Received: from [10.101.1.79] (10.101.1.79) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.298.1;
	Mon, 20 May 2013 14:47:39 +0200
Message-ID: <519A1B6A.8080600@digi.com>
Date: Mon, 20 May 2013 14:47:38 +0200
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: gst-plugins-base tremor build time dependence?
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
X-List-Received-Date: Mon, 20 May 2013 13:12:39 -0000
X-List-Received-Date: Mon, 20 May 2013 13:12:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

In gst-plugins-base package there is a patch that explicitly removes the 
'-DTREMOR' symbol so the package compiles without that support:

<http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patch>

But then the gst-plugins-base bitbake recipe has a build-time dependence 
on tremor:

<http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb>

DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora 
util-linux *tremor*"

Is this expected?
Can tremor build-time dependence be removed?

If this is the case i can cook up a patch, but I'm not sure if I'm 
missing something else.

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.


