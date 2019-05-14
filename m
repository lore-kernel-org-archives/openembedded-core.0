Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4E5417DE66
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 08:19:35 +0000 (UTC)
Received: from [10.1.14.230] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 860D8C4F65
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 10:19:35 +0200 (CEST)
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <3fbd04e5-296a-ad1c-6456-a33b7273dc66@pseudoterminal.org>
Date: Tue, 14 May 2019 10:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
Subject: Switching GStreamer recipes from autotools to meson
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2019 08:19:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

 From what I have seen, meson support is stable now.

Also, in GStreamer, autotools is now considered a legacy build system, 
and will be removed in future released. From 
https://gstreamer.freedesktop.org/releases/1.16/ :

 > The Meson build system build is now feature-complete (*) and it is 
now the recommended build system on all platforms and also used by 
Cerbero to build GStreamer on all platforms. The Autotools build is 
scheduled to be removed in the next cycle. Developers who currently use 
gst-uninstalled should move to gst-build. The build option naming has 
been cleaned up and made consistent and there are now feature options to 
enable/disable plugins and various other features on a case-by-case 
basis. (*) with the exception of plugin docs which will be handled 
differently in future

GStreamer recipe upgrades to 1.16.0 have been sent in as a pull request 
to meta-gstreamer1.0 . Once these are in, I'm considering to switch the 
recipes to meson. Are there any potential issues with that? For example, 
anything special about meson and GObject introspection I should know about?


