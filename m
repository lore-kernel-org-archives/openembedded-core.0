Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q2QBM-0007ZZ-MI
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 16:41:13 +0100
Received: by wwi18 with SMTP id 18so5753249wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 08:39:18 -0700 (PDT)
Received: by 10.216.213.37 with SMTP id z37mr6474525weo.2.1300894758176;
	Wed, 23 Mar 2011 08:39:18 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	m73sm2099238wej.16.2011.03.23.08.39.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 08:39:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110323153311.GG3418@jama.jama.net>
Date: Wed, 23 Mar 2011 16:39:16 +0100
Message-Id: <A8348FC7-5282-4BCB-9FDD-EC107944D8FB@dominion.thruhere.net>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<20110323153311.GG3418@jama.jama.net>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
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
X-List-Received-Date: Wed, 23 Mar 2011 15:41:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mrt 2011, om 16:33 heeft Martin Jansa het volgende geschreven:

> On Wed, Mar 23, 2011 at 08:19:31AM -0700, Khem Raj wrote:
>> On Wed, Mar 23, 2011 at 4:49 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>> Hi,
>>>=20
>>> I'd like to import the EFL recipes Martin did from meta-shr into the =
meta-openembedded repo. Before I go bothering Martin about it, what =
would be the best place to put them?
>>>=20
>>> Inside meta-oe:
>>>=20
>>> meta-openembedded/
>>>        meta-oe/
>>>                recipes-efl
>>=20
>> Can efl we layered directly on top of oe-core  ? i.e. without needing =
meta-oe
>> in that case its better to be an independent layer. otherwise I would =
say put
>> them under recipes-efl
>=20
> Do we want just efl there, or also e-wm, extra modules and apps from =
e17 dir,
> stuff like illume-image and tasks?
>=20
> meta-oe/recipes-efl looks enough for just efl, but then we should add
> something like meta-oe/recipes-e17 and it has also few own bbclasses, =
so I'm in=20
> favor of starting with meta-efl.
>=20
> I can try to move it to meta-efl and check how big is dependency-tree =
of

If you want to build e-wm, you need the following in meta-oe: giflib, =
mime-support, gnutls, libfribidi and a LIC_FILES_CHKSUM for guile

I currently have the following in meta-efl:

meta-efl/recipes-efl/e17/forecasts_svn.bb
meta-efl/recipes-efl/e17/e-wm_svn.bb
meta-efl/recipes-efl/e17/diskio_svn.bb
meta-efl/recipes-efl/e17/waker
=
meta-efl/recipes-efl/e17/waker/0001-waker-remove-old-ecore_string_init-and=
-ecore_string_.patch
meta-efl/recipes-efl/e17/exalt_svn.bb
meta-efl/recipes-efl/e17/efm-nav_svn.bb
meta-efl/recipes-efl/e17/enjoy_svn.bb
meta-efl/recipes-efl/e17/cpu_svn.bb
meta-efl/recipes-efl/e17/expedite_svn.bb
meta-efl/recipes-efl/e17/e-wm
meta-efl/recipes-efl/e17/e-wm/illume-disable-screensaver.patch
meta-efl/recipes-efl/e17/e-wm/illume-flaunch-fix.patch
meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.patch
meta-efl/recipes-efl/e17/e-wm/applications.menu
meta-efl/recipes-efl/e17/e-wm/enlightenment_start.oe
meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
meta-efl/recipes-efl/e17/emprint_svn.bb
meta-efl/recipes-efl/e17/exquisite_svn.bb
meta-efl/recipes-efl/e17/e-tasks
meta-efl/recipes-efl/e17/e-tasks/depends.eina.patch
meta-efl/recipes-efl/e17/e-tasks/genlist_item_insert_before.api.patch
meta-efl/recipes-efl/e17/efm-pathbar_svn.bb
meta-efl/recipes-efl/e17/uptime_svn.bb
meta-efl/recipes-efl/e17/illume-keyboards-shr
=
meta-efl/recipes-efl/e17/illume-keyboards-shr/0001-Makefile-update-KEYBOAR=
DS_DIR-for-new-illume2.patch
meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
meta-efl/recipes-efl/e17/e-tasks_svn.bb
meta-efl/recipes-efl/e17/eve_svn.bb
meta-efl/recipes-efl/e17/news_svn.bb
meta-efl/recipes-efl/e17/rain_svn.bb
meta-efl/recipes-efl/e17/efm-path_svn.bb
meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
meta-efl/recipes-efl/e17/places_svn.bb
meta-efl/recipes-efl/e17/elmdentica_svn.bb
meta-efl/recipes-efl/e17/elfe_svn.bb
meta-efl/recipes-efl/e17/notification_svn.bb
meta-efl/recipes-efl/e17/exalt-client_svn.bb
meta-efl/recipes-efl/e17/e-module.inc
meta-efl/recipes-efl/e17/rage_svn.bb
meta-efl/recipes-efl/e17/screenshot_svn.bb
meta-efl/recipes-efl/e17/flame_svn.bb
meta-efl/recipes-efl/e17/edje-viewer_svn.bb
meta-efl/recipes-efl/e17/exquisite
meta-efl/recipes-efl/e17/exquisite/exquisite-init
meta-efl/recipes-efl/e17/exquisite/splashfuncs
meta-efl/recipes-efl/e17/waker_svn.bb
meta-efl/recipes-efl/e17/eve
=
meta-efl/recipes-efl/e17/eve/0001-eve-remove-unconditional-ewk_view_contex=
t_menu_forwa.patch
meta-efl/recipes-efl/e17/eve/eve-theme-for-smaller-screens.patch
meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
meta-efl/recipes-efl/efl
meta-efl/recipes-efl/efl/azy_svn.bb
meta-efl/recipes-efl/efl/eeze_1.0.0.bb
meta-efl/recipes-efl/efl/efreet
meta-efl/recipes-efl/efl/efreet/changeset_trunk_r57435.patch
meta-efl/recipes-efl/efl/epdf_svn.bb
meta-efl/recipes-efl/efl/engrave_svn.bb
meta-efl/recipes-efl/efl/eet_svn.bb
meta-efl/recipes-efl/efl/elementary_svn.bb
meta-efl/recipes-efl/efl/edje_svn.bb
meta-efl/recipes-efl/efl/ecore_1.0.0.bb
meta-efl/recipes-efl/efl/ecore
meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
meta-efl/recipes-efl/efl/ecore/exit_uclibc.patch
meta-efl/recipes-efl/efl/edb_svn.bb
meta-efl/recipes-efl/efl/imlib2_svn.bb
meta-efl/recipes-efl/efl/eeze_svn.bb
meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
meta-efl/recipes-efl/efl/edje_1.0.0.bb
meta-efl/recipes-efl/efl/embryo_1.0.0.bb
meta-efl/recipes-efl/efl/edbus.inc
meta-efl/recipes-efl/efl/edbus_svn.bb
meta-efl/recipes-efl/efl/libeweather_svn.bb
meta-efl/recipes-efl/efl/edbus_1.0.0.bb
meta-efl/recipes-efl/efl/efreet_svn.bb
meta-efl/recipes-efl/efl/epeg_svn.bb
meta-efl/recipes-efl/efl/eina.inc
meta-efl/recipes-efl/efl/emotion_svn.bb
meta-efl/recipes-efl/efl/libeflvala_svn.bb
meta-efl/recipes-efl/efl/eina_svn.bb
meta-efl/recipes-efl/efl/ecore_svn.bb
meta-efl/recipes-efl/efl/embryo.inc
meta-efl/recipes-efl/efl/embryo_svn.bb
meta-efl/recipes-efl/efl/edje-fpu.inc
meta-efl/recipes-efl/efl/eet_1.4.0.bb
meta-efl/recipes-efl/efl/eeze.inc
meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
meta-efl/recipes-efl/efl/evas.inc
meta-efl/recipes-efl/efl/ecore.inc
meta-efl/recipes-efl/efl/ethumb_svn.bb
meta-efl/recipes-efl/efl/edje.inc
meta-efl/recipes-efl/efl/efreet_1.0.0.bb
meta-efl/recipes-efl/efl/evas_svn.bb
meta-efl/recipes-efl/tasks
meta-efl/recipes-efl/tasks/task-x11-illume.bb
meta-efl/conf
meta-efl/conf/layer.conf
meta-efl/classes
meta-efl/classes/e.bbclass
meta-efl/classes/e-base.bbclass
meta-efl/classes/vala.bbclass
meta-efl/classes/efl.bbclass

I'll push the meta-oe bits later tonight and leave the meta-efl stuff up =
to Martin :)

After we sort out the libnl1/nm mess in .dev I'm going to work on =
meta-gnome.

regards,

Koen=


