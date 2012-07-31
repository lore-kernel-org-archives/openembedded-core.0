Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SwA14-0008Rg-No
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 12:49:30 +0200
Received: by yhjj56 with SMTP id j56so5286027yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 03:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=hC5Bp/OvRU8srsHAXmlSHlxF6nmgxztHLnXLNGuP0io=;
	b=AMxEg2a3i2HodLbLl992PLINmITq17coNzfyCeWizb0KFk900a97We6KBxesPAZucq
	b5dQgooRRguI3q9qAMiK5ZlrYAMWeNGMw4OFbyjGc3nvUkXmlFsUE46ajynMJVU7/CPi
	C4pHtOhqjowwjbLvsxFyf02tAZppX3hUdFw87k2iF9uXjl77TpP85sy2NJC1Sq/wx9sk
	OVAq61Hi1j6GyJnKd0Rns2rWjjQVLonXCB2mF8DXoszI7cbI2BkAJfUzlXRm1V24kqYG
	o+7aYRqWjuJuqrDbebIK+/BD4VwYNWVxpqUpmfJxYobo8hz2V+/kuTE86liC5CPnBHAw
	ZQPA==
MIME-Version: 1.0
Received: by 10.50.208.34 with SMTP id mb2mr276466igc.5.1343731072880; Tue, 31
	Jul 2012 03:37:52 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Tue, 31 Jul 2012 03:37:52 -0700 (PDT)
Date: Tue, 31 Jul 2012 12:37:52 +0200
Message-ID: <CALbNGRR4weykX9t_XwJ6ACVoXS2SbogcxXLPAj7vpAC2+AQpww@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: do_rootfs fails
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
X-List-Received-Date: Tue, 31 Jul 2012 10:49:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

after long journey mending recipes I now get with latest updates:

|  * opkg_install_cmd: Cannot install package gnome-icon-theme-locale-fr.
|  * opkg_install_cmd: Cannot install package gnome-icon-theme-locale-en-gb.
|  * opkg_install_cmd: Cannot install package gnome-icon-theme-locale-de.
|  * satisfy_dependencies_for: Cannot satisfy the following
dependencies for gcc-runtime-locale-fr:
|  * 	gcc-runtime *
|  * opkg_install_cmd: Cannot install package gcc-runtime-locale-fr.
|  * satisfy_dependencies_for: Cannot satisfy the following
dependencies for gcc-runtime-locale-de:
|  * 	gcc-runtime *
|  * opkg_install_cmd: Cannot install package gcc-runtime-locale-de.

I checked:

* gnome-icon-theme-locale-* are empty
* gcc-runtime is not there

Any suggestion what causes this?

Andreas


