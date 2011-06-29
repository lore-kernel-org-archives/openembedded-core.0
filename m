Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qc2Ez-0003gw-BU
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 23:24:09 +0200
Received: by wwi14 with SMTP id 14so281326wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:20:26 -0700 (PDT)
Received: by 10.227.164.199 with SMTP id f7mr1137425wby.70.1309382423385;
	Wed, 29 Jun 2011 14:20:23 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fi5sm1182414wbb.5.2011.06.29.14.20.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 14:20:22 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E0B9584.4070909@linux.intel.com>
Date: Wed, 29 Jun 2011 23:20:21 +0200
Message-Id: <4F72A799-B60A-4B2B-8F58-C1DDAEFBDD12@dominion.thruhere.net>
References: <cover.1309246787.git.edwin.zhai@intel.com>	<2c83cbe9b56b589ad8786d8d371c2d85810b31f2.1309246787.git.edwin.zhai@intel.com>
	<1309269269.20015.295.camel@rex> <4E0B9584.4070909@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/3] glib-networking: Add 2.28.7 as new recipe
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
X-List-Received-Date: Wed, 29 Jun 2011 21:24:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 jun 2011, om 23:13 heeft Saul Wold het volgende geschreven:

> On 06/28/2011 06:54 AM, Richard Purdie wrote:
>> On Tue, 2011-06-28 at 15:42 +0800, edwin.zhai@intel.com wrote:
>>> From: Zhai Edwin<edwin.zhai@intel.com>
>>>=20
>>> glib-networking contains the implementations of certain GLib =
networking
>>> features that cannot be implemented directly in GLib itself because =
of their
>>> dependencies. TLS/SSL support is one of them, which is needed for =
accessing SSL
>>> web page.
>>>=20
>>> Signed-off-by: Zhai Edwin<edwin.zhai@intel.com>
>>> ---
>>>  .../glib-networking/glib-networking_2.28.7.bb      |   21 =
++++++++++++++++++++
>>>  1 files changed, 21 insertions(+), 0 deletions(-)
>>>  create mode 100644 =
meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
>>=20
>> I merged this patch but we should revisit the issue of the gnome =
bbclass
>> files in a subsequent patch.
>>=20
> Should this not go into recipes-support?

I'd put it in the same dir as the other glib recipes to make it easier =
to find.=


