Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9D44C774B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 15:44:30 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gi6so1381123pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 08:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=uDgBidDc9BrK4UNHdWx2a5dRE95sYwHGN5FbcOwJMdo=;
	b=I6LOWy4JKAlx8tH8pcLOHE7pfgajHyT2UoSys6oZGdZ1AmHb0TPrsmmkO4rx0+0+SN
	ZIDuEmYZw2O3z7N3pbe6tG3SGUujYCtg+VVftb0t646QloqFidWQXVnqiWajzMn1L7Uh
	D9GjTKw/78uBC/likork3w6J8eIzeiB8KXtX7RbxkMnlOmua7RUhXLMIzFahtWi8I0kQ
	ne7941oyxMk3duUIehbyt63S2rOPBTFY2qf9ShCRvUAWQLrmHfKuQAUyct1TsWSCb4Vn
	2PlRv0n2eU0L5SmLzlM6IIEAzxz4jVbBliWgVqq3v5IzOwdJOmlqXtf0XrAZ4sgG8pLF
	ujSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=uDgBidDc9BrK4UNHdWx2a5dRE95sYwHGN5FbcOwJMdo=;
	b=BksOIyeqLWOazpWqakwpeth7VEbwxabM2U2EaiBLOLh4lvHpMmm6m5SOWeTGhnWL1j
	5ajm0yd7zli6Frx7r3tlK6yipN0iqPmxI3rUG2pph0InC4YkTCEkC4SKEysdNVKaGy8A
	98cqq6l1CzGCQ8pPipGVEhPLUiHG1y3P5Zu4qDh5fDzVKyOcOUik/vcv1QY6A6+M3u2M
	W/FkSZcljvL3EPcP+wfGXHc/WlICo2sFolfaUvVfNFINzGNHQWl7sUl5WfMLXmo/zv+Z
	Bd5lHqXuKZgl4nP9q2H81ulGdIVBeblOJE6zG2g52aDMj2zYmkXZ1DfxrDxPlSfWpeYF
	nlfg==
X-Gm-Message-State: AE9vXwNBO/WaMcNdKdYZse+c0Ns+6kVzHPCAJlqoolIjzR4fAD92uUBp8ZtiLqI0VsEN8A==
X-Received: by 10.66.220.194 with SMTP id py2mr72737320pac.77.1473176670081;
	Tue, 06 Sep 2016 08:44:30 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:c476:2925:157e:53b0?
	([2601:202:4001:9ea0:c476:2925:157e:53b0])
	by smtp.gmail.com with ESMTPSA id 9sm41974976pfo.74.2016.09.06.08.44.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Sep 2016 08:44:29 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1470256891-20386-1-git-send-email-tanuk@iki.fi>
	<1473156037.3139.82.camel@iki.fi>
From: akuster808 <akuster808@gmail.com>
Message-ID: <8545e7af-49ad-8975-01d6-ed9d2cc6c577@gmail.com>
Date: Tue, 6 Sep 2016 08:44:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473156037.3139.82.camel@iki.fi>
Subject: Re: [PATCH][krogoth] pulseaudio: fix crash when disconnecting bluetooth devices
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
X-List-Received-Date: Tue, 06 Sep 2016 15:44:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/06/2016 03:00 AM, Tanu Kaskinen wrote:
> Ping? I sent this patch for krogoth (and a similar patch for jethro)
> about a month ago, but it hasn't been applied yet. This is the first
> time I'm sending patches for past releases - are there other hoops to
> jump through than adding the [krogoth] tag to the mail subject?
I have this sitting in my krogoth-next contrib branch. Did that right 
before my holiday so I did not send out a message.

should be in the next pull request I do.

- armin
>
> The patch fixes a pulseaudio crash that will be triggered by most
> bluetooth headsets. I see the commit message isn't clear about the
> severity of the problem, so maybe that's why this didn't look important
> enough to apply?
>
> The Upstream-Status is set to Submitted, but the actual state is now
> Accepted.
>
> -- Tanu
>
>
> On Wed, 2016-08-03 at 23:41 +0300, Tanu Kaskinen wrote:
>> [YOCTO #10018]
>>
>> Add a patch that makes the bluetooth code create the HSP/HFP card
>> profile only once. The old behaviour of creating the profile twice
>> was not compatible with 0001-card-add-pa_card_profile.ports.patch.
>>
>> This fix is not needed for master, because master doesn't any more
>> have 0001-card-add-pa_card_profile.ports.patch.
>>
>> Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
>> ---
>>   ...th-don-t-create-the-HSP-HFP-profile-twice.patch | 343 +++++++++++++++++++++
>>   .../pulseaudio/pulseaudio_8.0.bb                   |   1 +
>>   2 files changed, 344 insertions(+)
>>   create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-bluetooth-don-t-create-the-HSP-HFP-profile-twice.patch
>>
>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-bluetooth-don-t-create-the-HSP-HFP-profile-twice.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-bluetooth-don-t-create-the-HSP-HFP-profile-twice.patch
>> new file mode 100644
>> index 0000000..a5ca325
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-bluetooth-don-t-create-the-HSP-HFP-profile-twice.patch
>> @@ -0,0 +1,343 @@
>> +From 14ff15bf5acac7b7edd64e2240fc6fe5d227b8c4 Mon Sep 17 00:00:00 2001
>> +From: Tanu Kaskinen <tanuk@iki.fi>
>> +Date: Sun, 31 Jul 2016 01:03:02 +0300
>> +Subject: [PATCH] bluetooth: don't create the HSP/HFP profile twice
>> +
>> +create_card_profile() used to get called separately for HSP and HFP,
>> +so if a headset supports both profiles, a profile named
>> +"headset_head_unit" would get created twice. The second instance would
>> +get immediately freed, so that wasn't a particularly serious problem.
>> +However, I think it makes more sense to create the profile only once.
>> +This patch makes things so that before a profile is created, we check
>> +what name that profile would have, and if a profile with that name
>> +already exists, we don't create the profile.
>> +
>> +A couple of Yocto releases (jethro and krogoth) have non-upstream
>> +patches that suffer from this double creation. The patches add
>> +associations between profiles and ports, and those associations use
>> +the profile name as the key. When the second profile gets freed, the
>> +associations between the profile and its ports get removed, and since
>> +the profile name is used as the key, this erroneously affects the
>> +first profile too. Crashing ensues.
>> +
>> +I have tested this only with BlueZ 5.
>> +
>> +BugLink: https://bugzilla.yoctoproject.org/show_bug.cgi?id=10018
>> +
>> +Upstream-Status: Submitted [https://patchwork.freedesktop.org/patch/101926/]
>> +
>> +Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
>> +---
>> + src/modules/bluetooth/module-bluez4-device.c | 81 +++++++++++++++++-----------
>> + src/modules/bluetooth/module-bluez5-device.c | 72 ++++++++++++++++---------
>> + 2 files changed, 99 insertions(+), 54 deletions(-)
>> +
>> +diff --git a/src/modules/bluetooth/module-bluez4-device.c b/src/modules/bluetooth/module-bluez4-device.c
>> +index 5d0d3db..df51168 100644
>> +--- a/src/modules/bluetooth/module-bluez4-device.c
>> ++++ b/src/modules/bluetooth/module-bluez4-device.c
>> +@@ -2162,18 +2162,23 @@ static void create_card_ports(struct userdata *u, pa_hashmap *ports) {
>> + }
>> +
>> + /* Run from main thread */
>> +-static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid, pa_hashmap *ports) {
>> ++static pa_card_profile *create_card_profile(struct userdata *u, pa_bluez4_profile_t profile, pa_hashmap *ports) {
>> +     pa_device_port *input_port, *output_port;
>> ++    const char *name;
>> +     pa_card_profile *p = NULL;
>> +-    pa_bluez4_profile_t *d;
>> ++    pa_bluez4_profile_t *d = NULL;
>> ++    pa_bluez4_transport *t;
>> +
>> +     pa_assert(u->input_port_name);
>> +     pa_assert(u->output_port_name);
>> +     pa_assert_se(input_port = pa_hashmap_get(ports, u->input_port_name));
>> +     pa_assert_se(output_port = pa_hashmap_get(ports, u->output_port_name));
>> +
>> +-    if (pa_streq(uuid, A2DP_SINK_UUID)) {
>> +-        p = pa_card_profile_new("a2dp", _("High Fidelity Playback (A2DP)"), sizeof(pa_bluez4_profile_t));
>> ++    name = pa_bluez4_profile_to_string(profile);
>> ++
>> ++    switch (profile) {
>> ++    case PA_BLUEZ4_PROFILE_A2DP:
>> ++        p = pa_card_profile_new(name, _("High Fidelity Playback (A2DP)"), sizeof(pa_bluez4_profile_t));
>> +         p->priority = 10;
>> +         p->n_sinks = 1;
>> +         p->n_sources = 0;
>> +@@ -2183,9 +2188,10 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
>> +         pa_card_profile_add_port(p, output_port);
>> +
>> +         d = PA_CARD_PROFILE_DATA(p);
>> +-        *d = PA_BLUEZ4_PROFILE_A2DP;
>> +-    } else if (pa_streq(uuid, A2DP_SOURCE_UUID)) {
>> +-        p = pa_card_profile_new("a2dp_source", _("High Fidelity Capture (A2DP)"), sizeof(pa_bluez4_profile_t));
>> ++        break;
>> ++
>> ++    case PA_BLUEZ4_PROFILE_A2DP_SOURCE:
>> ++        p = pa_card_profile_new(name, _("High Fidelity Capture (A2DP)"), sizeof(pa_bluez4_profile_t));
>> +         p->priority = 10;
>> +         p->n_sinks = 0;
>> +         p->n_sources = 1;
>> +@@ -2195,9 +2201,10 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
>> +         pa_card_profile_add_port(p, input_port);
>> +
>> +         d = PA_CARD_PROFILE_DATA(p);
>> +-        *d = PA_BLUEZ4_PROFILE_A2DP_SOURCE;
>> +-    } else if (pa_streq(uuid, HSP_HS_UUID) || pa_streq(uuid, HFP_HS_UUID)) {
>> +-        p = pa_card_profile_new("hsp", _("Telephony Duplex (HSP/HFP)"), sizeof(pa_bluez4_profile_t));
>> ++        break;
>> ++
>> ++    case PA_BLUEZ4_PROFILE_HSP:
>> ++        p = pa_card_profile_new(name, _("Telephony Duplex (HSP/HFP)"), sizeof(pa_bluez4_profile_t));
>> +         p->priority = 20;
>> +         p->n_sinks = 1;
>> +         p->n_sources = 1;
>> +@@ -2209,9 +2216,10 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
>> +         pa_card_profile_add_port(p, output_port);
>> +
>> +         d = PA_CARD_PROFILE_DATA(p);
>> +-        *d = PA_BLUEZ4_PROFILE_HSP;
>> +-    } else if (pa_streq(uuid, HFP_AG_UUID)) {
>> +-        p = pa_card_profile_new("hfgw", _("Handsfree Gateway"), sizeof(pa_bluez4_profile_t));
>> ++        break;
>> ++
>> ++    case PA_BLUEZ4_PROFILE_HFGW:
>> ++        p = pa_card_profile_new(name, _("Handsfree Gateway"), sizeof(pa_bluez4_profile_t));
>> +         p->priority = 20;
>> +         p->n_sinks = 1;
>> +         p->n_sources = 1;
>> +@@ -2223,19 +2231,35 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
>> +         pa_card_profile_add_port(p, output_port);
>> +
>> +         d = PA_CARD_PROFILE_DATA(p);
>> +-        *d = PA_BLUEZ4_PROFILE_HFGW;
>> ++        break;
>> ++
>> ++    case PA_BLUEZ4_PROFILE_OFF:
>> ++        pa_assert_not_reached();
>> +     }
>> +
>> +-    if (p) {
>> +-        pa_bluez4_transport *t;
>> ++    *d = profile;
>> +
>> +-        if ((t = u->device->transports[*d]))
>> +-            p->available = transport_state_to_availability(t->state);
>> +-    }
>> ++    if ((t = u->device->transports[*d]))
>> ++        p->available = transport_state_to_availability(t->state);
>> +
>> +     return p;
>> + }
>> +
>> ++static int uuid_to_profile(const char *uuid, pa_bluez4_profile_t *_r) {
>> ++    if (pa_streq(uuid, A2DP_SINK_UUID))
>> ++        *_r = PA_BLUEZ4_PROFILE_A2DP;
>> ++    else if (pa_streq(uuid, A2DP_SOURCE_UUID))
>> ++        *_r = PA_BLUEZ4_PROFILE_A2DP_SOURCE;
>> ++    else if (pa_streq(uuid, HSP_HS_UUID) || pa_streq(uuid, HFP_HS_UUID))
>> ++        *_r = PA_BLUEZ4_PROFILE_HSP;
>> ++    else if (pa_streq(uuid, HSP_AG_UUID) || pa_streq(uuid, HFP_AG_UUID))
>> ++        *_r = PA_BLUEZ4_PROFILE_HFGW;
>> ++    else
>> ++        return -PA_ERR_INVALID;
>> ++
>> ++    return 0;
>> ++}
>> ++
>> + /* Run from main thread */
>> + static int add_card(struct userdata *u) {
>> +     pa_card_new_data data;
>> +@@ -2283,16 +2307,15 @@ static int add_card(struct userdata *u) {
>> +     create_card_ports(u, data.ports);
>> +
>> +     PA_LLIST_FOREACH(uuid, device->uuids) {
>> +-        p = create_card_profile(u, uuid->uuid, data.ports);
>> ++        pa_bluez4_profile_t profile;
>> +
>> +-        if (!p)
>> ++        if (uuid_to_profile(uuid->uuid, &profile) < 0)
>> +             continue;
>> +
>> +-        if (pa_hashmap_get(data.profiles, p->name)) {
>> +-            pa_card_profile_free(p);
>> ++        if (pa_hashmap_get(data.profiles, pa_bluez4_profile_to_string(profile)))
>> +             continue;
>> +-        }
>> +
>> ++        p = create_card_profile(u, profile, data.ports);
>> +         pa_hashmap_put(data.profiles, p->name, p);
>> +     }
>> +
>> +@@ -2382,6 +2405,7 @@ static pa_bluez4_device* find_device(struct userdata *u, const char *address, co
>> + /* Run from main thread */
>> + static pa_hook_result_t uuid_added_cb(pa_bluez4_discovery *y, const struct pa_bluez4_hook_uuid_data *data,
>> +                                       struct userdata *u) {
>> ++    pa_bluez4_profile_t profile;
>> +     pa_card_profile *p;
>> +
>> +     pa_assert(data);
>> +@@ -2392,16 +2416,13 @@ static pa_hook_result_t uuid_added_cb(pa_bluez4_discovery *y, const struct pa_bl
>> +     if (data->device != u->device)
>> +         return PA_HOOK_OK;
>> +
>> +-    p = create_card_profile(u, data->uuid, u->card->ports);
>> +-
>> +-    if (!p)
>> ++    if (uuid_to_profile(data->uuid, &profile) < 0)
>> +         return PA_HOOK_OK;
>> +
>> +-    if (pa_hashmap_get(u->card->profiles, p->name)) {
>> +-        pa_card_profile_free(p);
>> ++    if (pa_hashmap_get(u->card->profiles, pa_bluez4_profile_to_string(profile)))
>> +         return PA_HOOK_OK;
>> +-    }
>> +
>> ++    p = create_card_profile(u, profile, u->card->ports);
>> +     pa_card_add_profile(u->card, p);
>> +
>> +     return PA_HOOK_OK;
>> +diff --git a/src/modules/bluetooth/module-bluez5-device.c b/src/modules/bluetooth/module-bluez5-device.c
>> +index 7b90a31..db06ac1 100644
>> +--- a/src/modules/bluetooth/module-bluez5-device.c
>> ++++ b/src/modules/bluetooth/module-bluez5-device.c
>> +@@ -1772,8 +1772,9 @@ static void create_card_ports(struct userdata *u, pa_hashmap *ports) {
>> + }
>> +
>> + /* Run from main thread */
>> +-static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid, pa_hashmap *ports) {
>> ++static pa_card_profile *create_card_profile(struct userdata *u, pa_bluetooth_profile_t profile, pa_hashmap *ports) {
>> +     pa_device_port *input_port, *output_port;
>> ++    const char *name;
>> +     pa_card_profile *cp = NULL;
>> +     pa_bluetooth_profile_t *p;
>> +
>> +@@ -1782,8 +1783,11 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
>> +     pa_assert_se(input_port = pa_hashmap_get(ports, u->input_port_name));
>> +     pa_assert_se(output_port = pa_hashmap_get(ports, u->output_port_name));
>> +
>> +-    if (pa_streq(uuid, PA_BLUETOOTH_UUID_A2DP_SINK)) {
>> +-        cp = pa_card_profile_new("a2dp_sink", _("High Fidelity Playback (A2DP Sink)"), sizeof(pa_bluetooth_profile_t));
>> ++    name = pa_bluetooth_profile_to_string(profile);
>> ++
>> ++    switch (profile) {
>> ++    case PA_BLUETOOTH_PROFILE_A2DP_SINK:
>> ++        cp = pa_card_profile_new(name, _("High Fidelity Playback (A2DP Sink)"), sizeof(pa_bluetooth_profile_t));
>> +         cp->priority = 10;
>> +         cp->n_sinks = 1;
>> +         cp->n_sources = 0;
>> +@@ -1793,9 +1797,10 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
>> +         pa_card_profile_add_port(cp, output_port);
>> +
>> +         p = PA_CARD_PROFILE_DATA(cp);
>> +-        *p = PA_BLUETOOTH_PROFILE_A2DP_SINK;
>> +-    } else if (pa_streq(uuid, PA_BLUETOOTH_UUID_A2DP_SOURCE)) {
>> +-        cp = pa_card_profile_new("a2dp_source", _("High Fidelity Capture (A2DP Source)"), sizeof(pa_bluetooth_profile_t));
>> ++        break;
>> ++
>> ++    case PA_BLUETOOTH_PROFILE_A2DP_SOURCE:
>> ++        cp = pa_card_profile_new(name, _("High Fidelity Capture (A2DP Source)"), sizeof(pa_bluetooth_profile_t));
>> +         cp->priority = 10;
>> +         cp->n_sinks = 0;
>> +         cp->n_sources = 1;
>> +@@ -1805,9 +1810,10 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
>> +         pa_card_profile_add_port(cp, input_port);
>> +
>> +         p = PA_CARD_PROFILE_DATA(cp);
>> +-        *p = PA_BLUETOOTH_PROFILE_A2DP_SOURCE;
>> +-    } else if (pa_streq(uuid, PA_BLUETOOTH_UUID_HSP_HS) || pa_streq(uuid, PA_BLUETOOTH_UUID_HFP_HF)) {
>> +-        cp = pa_card_profile_new("headset_head_unit", _("Headset Head Unit (HSP/HFP)"), sizeof(pa_bluetooth_profile_t));
>> ++        break;
>> ++
>> ++    case PA_BLUETOOTH_PROFILE_HEADSET_HEAD_UNIT:
>> ++        cp = pa_card_profile_new(name, _("Headset Head Unit (HSP/HFP)"), sizeof(pa_bluetooth_profile_t));
>> +         cp->priority = 20;
>> +         cp->n_sinks = 1;
>> +         cp->n_sources = 1;
>> +@@ -1819,9 +1825,10 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
>> +         pa_card_profile_add_port(cp, output_port);
>> +
>> +         p = PA_CARD_PROFILE_DATA(cp);
>> +-        *p = PA_BLUETOOTH_PROFILE_HEADSET_HEAD_UNIT;
>> +-    } else if (pa_streq(uuid, PA_BLUETOOTH_UUID_HSP_AG) || pa_streq(uuid, PA_BLUETOOTH_UUID_HFP_AG)) {
>> +-        cp = pa_card_profile_new("headset_audio_gateway", _("Headset Audio Gateway (HSP/HFP)"), sizeof(pa_bluetooth_profile_t));
>> ++        break;
>> ++
>> ++    case PA_BLUETOOTH_PROFILE_HEADSET_AUDIO_GATEWAY:
>> ++        cp = pa_card_profile_new(name, _("Headset Audio Gateway (HSP/HFP)"), sizeof(pa_bluetooth_profile_t));
>> +         cp->priority = 20;
>> +         cp->n_sinks = 1;
>> +         cp->n_sources = 1;
>> +@@ -1833,16 +1840,19 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
>> +         pa_card_profile_add_port(cp, output_port);
>> +
>> +         p = PA_CARD_PROFILE_DATA(cp);
>> +-        *p = PA_BLUETOOTH_PROFILE_HEADSET_AUDIO_GATEWAY;
>> +-    }
>> ++        break;
>> +
>> +-    if (cp) {
>> +-        if (u->device->transports[*p])
>> +-            cp->available = transport_state_to_availability(u->device->transports[*p]->state);
>> +-        else
>> +-            cp->available = PA_AVAILABLE_NO;
>> ++    case PA_BLUETOOTH_PROFILE_OFF:
>> ++        pa_assert_not_reached();
>> +     }
>> +
>> ++    *p = profile;
>> ++
>> ++    if (u->device->transports[*p])
>> ++        cp->available = transport_state_to_availability(u->device->transports[*p]->state);
>> ++    else
>> ++        cp->available = PA_AVAILABLE_NO;
>> ++
>> +     return cp;
>> + }
>> +
>> +@@ -1888,6 +1898,21 @@ off:
>> +     return -PA_ERR_IO;
>> + }
>> +
>> ++static int uuid_to_profile(const char *uuid, pa_bluetooth_profile_t *_r) {
>> ++    if (pa_streq(uuid, PA_BLUETOOTH_UUID_A2DP_SINK))
>> ++        *_r = PA_BLUETOOTH_PROFILE_A2DP_SINK;
>> ++    else if (pa_streq(uuid, PA_BLUETOOTH_UUID_A2DP_SOURCE))
>> ++        *_r = PA_BLUETOOTH_PROFILE_A2DP_SOURCE;
>> ++    else if (pa_streq(uuid, PA_BLUETOOTH_UUID_HSP_HS) || pa_streq(uuid, PA_BLUETOOTH_UUID_HFP_HF))
>> ++        *_r = PA_BLUETOOTH_PROFILE_HEADSET_HEAD_UNIT;
>> ++    else if (pa_streq(uuid, PA_BLUETOOTH_UUID_HSP_AG) || pa_streq(uuid, PA_BLUETOOTH_UUID_HFP_AG))
>> ++        *_r = PA_BLUETOOTH_PROFILE_HEADSET_AUDIO_GATEWAY;
>> ++    else
>> ++        return -PA_ERR_INVALID;
>> ++
>> ++    return 0;
>> ++}
>> ++
>> + /* Run from main thread */
>> + static int add_card(struct userdata *u) {
>> +     const pa_bluetooth_device *d;
>> +@@ -1929,16 +1954,15 @@ static int add_card(struct userdata *u) {
>> +     create_card_ports(u, data.ports);
>> +
>> +     PA_HASHMAP_FOREACH(uuid, d->uuids, state) {
>> +-        cp = create_card_profile(u, uuid, data.ports);
>> ++        pa_bluetooth_profile_t profile;
>> +
>> +-        if (!cp)
>> ++        if (uuid_to_profile(uuid, &profile) < 0)
>> +             continue;
>> +
>> +-        if (pa_hashmap_get(data.profiles, cp->name)) {
>> +-            pa_card_profile_free(cp);
>> ++        if (pa_hashmap_get(data.profiles, pa_bluetooth_profile_to_string(profile)))
>> +             continue;
>> +-        }
>> +
>> ++        cp = create_card_profile(u, profile, data.ports);
>> +         pa_hashmap_put(data.profiles, cp->name, cp);
>> +     }
>> +
>> +--
>> +2.8.1
>> +
>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_8.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_8.0.bb
>> index b01ba8f..b947c62 100644
>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_8.0.bb
>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_8.0.bb
>> @@ -9,6 +9,7 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
>>              file://0003-card-move-profile-selection-after-pa_card_new.patch \
>>              file://0004-alsa-set-availability-for-some-unavailable-profiles.patch \
>>              file://0001-Revert-module-switch-on-port-available-Route-to-pref.patch \
>> +           file://0001-bluetooth-don-t-create-the-HSP-HFP-profile-twice.patch \
>>   "
>>   SRC_URI[md5sum] = "8678442ba0bb4b4c33ac6f62542962df"
>>   SRC_URI[sha256sum] = "690eefe28633466cfd1ab9d85ebfa9376f6b622deec6bfee5091ac9737cd1989"
>> -- 
>> 2.8.1
>>


