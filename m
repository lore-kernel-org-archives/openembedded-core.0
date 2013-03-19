Received: from mail-pd0-f178.google.com ([209.85.192.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UI0B8-0001kw-J4
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 18:18:29 +0100
Received: by mail-pd0-f178.google.com with SMTP id u10so246497pdi.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 10:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=r+a0vlTX2n+3PaK9+7WX1bPFnUj8FKZBCOfvIbYE2eE=;
	b=SgB5MV5iCI+/eP9p+MRWGDSZSIcg/pytC96nSOr6Qd1NK4V5GengYxKiad7656A3x5
	SKtbbOrN8XZIhoJH6nvlrC2yXvnCT+ga4bInaxaAbGtX4pvdX9i/d5TbUNHmMyOzgErc
	XePgP26lKyG3GF7nmcUDJtf39n5NJHrz6oP6bvx3/znvsRDbczfNQqSFZtlydw6B1UoK
	qkifumq/JmPj51340LO93IeHDfoJ5wqAHUSRqqTgPnSekR67IiqSmDte54N3ucPjBBAf
	gapNYKmHwgsmBZ7CQYmaXG5b0w9k99VcyI7c4lu7iAKPasmL/BpDgnLQxN5FcT3CvEgF
	pb8A==
X-Received: by 10.66.126.141 with SMTP id my13mr4234422pab.178.1363712496206; 
	Tue, 19 Mar 2013 10:01:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kb3sm24950766pbc.21.2013.03.19.10.01.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 19 Mar 2013 10:01:35 -0700 (PDT)
Date: Tue, 19 Mar 2013 18:01:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Message-ID: <20130319170128.GA3202@jama>
References: <20130318131702.517A650409@opal>
MIME-Version: 1.0
In-Reply-To: <20130318131702.517A650409@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Radu Moisan : apr-util: Upgrade to v1.5.1
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
X-List-Received-Date: Tue, 19 Mar 2013 17:18:29 -0000
X-Groupsio-MsgNum: 36759
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2013 at 01:17:02PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 526f6beb5a8a1844f3d2c03fe38087e4f4a7f68f
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D526f6beb5a8a1844f3d2c03fe38087e4f4a7f68f
>=20
> Author: Radu Moisan <radu.moisan@intel.com>
> Date:   Thu Mar 14 18:16:02 2013 +0200
>=20
> apr-util: Upgrade to v1.5.1
>=20
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

In some configurations it's now failing without --tag=3DCC in libtool
calls, this one is from xscalete (spitz) build:

| make[1]: Entering directory `/OE/shr-core/tmp-eglibc/work/xscalete-oe-lin=
ux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1'
| gawk -f /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/share/apr//make_export=
s.awk /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1=
-r0/apr-util-1.5.1/include/apr_anylock.h /OE/shr-core/tmp-eglibc/work/xscal=
ete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_base64.h =
/OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/ap=
r-util-1.5.1/include/apr_buckets.h /OE/shr-core/tmp-eglibc/work/xscalete-oe=
-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_crypto.h /OE/sh=
r-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util=
-1.5.1/include/apr_date.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gn=
ueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_dbd.h /OE/shr-core/tmp-e=
glibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/inclu=
de/apr_dbm.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-uti=
l/1.5.1-r0/apr-util-1.5.1/include/apr_hooks.h /OE/shr-core/tmp-eglibc/work/=
xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_ldap=
_init.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5=
=2E1-r0/apr-util-1.5.1/include/apr_ldap_option.h /OE/shr-core/tmp-eglibc/wo=
rk/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_l=
dap_rebind.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-uti=
l/1.5.1-r0/apr-util-1.5.1/include/apr_ldap_url.h /OE/shr-core/tmp-eglibc/wo=
rk/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_m=
d4.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-=
r0/apr-util-1.5.1/include/apr_md5.h /OE/shr-core/tmp-eglibc/work/xscalete-o=
e-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_memcache.h /OE=
/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-u=
til-1.5.1/include/apr_optional.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-l=
inux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_optional_hooks.h =
/OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/ap=
r-util-1.5.1/include/apr_queue.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-l=
inux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_reslist.h /OE/shr=
-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-=
1.5.1/include/apr_rmm.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnue=
abi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_sdbm.h /OE/shr-core/tmp-eg=
libc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/includ=
e/apr_sha1.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-uti=
l/1.5.1-r0/apr-util-1.5.1/include/apr_strmatch.h /OE/shr-core/tmp-eglibc/wo=
rk/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_t=
hread_pool.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-uti=
l/1.5.1-r0/apr-util-1.5.1/include/apr_uri.h /OE/shr-core/tmp-eglibc/work/xs=
calete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_uuid.h=
 /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/a=
pr-util-1.5.1/include/apr_xlate.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-=
linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_xml.h /OE/shr-co=
re/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5=
=2E1/include/apu_errno.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnu=
eabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apu_version.h /OE/shr-core/tm=
p-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/in=
clude/private/apr_crypto_internal.h /OE/shr-core/tmp-eglibc/work/xscalete-o=
e-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/private/apr_dbd_in=
ternal.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.=
5.1-r0/apr-util-1.5.1/include/private/apr_dbd_odbc_v2.h /OE/shr-core/tmp-eg=
libc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/includ=
e/private/apr_dbm_private.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-=
gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/private/apu_internal.h > e=
xports.c
| gawk -f /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/share/apr//make_var_ex=
port.awk /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.=
5.1-r0/apr-util-1.5.1/include/apr_anylock.h /OE/shr-core/tmp-eglibc/work/xs=
calete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_base64=
=2Eh /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-=
r0/apr-util-1.5.1/include/apr_buckets.h /OE/shr-core/tmp-eglibc/work/xscale=
te-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_crypto.h /=
OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr=
-util-1.5.1/include/apr_date.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-lin=
ux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_dbd.h /OE/shr-core/=
tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/=
include/apr_dbm.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/ap=
r-util/1.5.1-r0/apr-util-1.5.1/include/apr_hooks.h /OE/shr-core/tmp-eglibc/=
work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr=
_ldap_init.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-uti=
l/1.5.1-r0/apr-util-1.5.1/include/apr_ldap_option.h /OE/shr-core/tmp-eglibc=
/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/ap=
r_ldap_rebind.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-=
util/1.5.1-r0/apr-util-1.5.1/include/apr_ldap_url.h /OE/shr-core/tmp-eglibc=
/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/ap=
r_md4.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5=
=2E1-r0/apr-util-1.5.1/include/apr_md5.h /OE/shr-core/tmp-eglibc/work/xscal=
ete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_memcache.=
h /OE/shr-core/tm
p-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/in=
clude/apr_optional.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi=
/apr-uti
l/1.5.1-r0/apr-util-1.5.1/include/apr_optional_hooks.h /OE/shr-core/tmp-egl=
ibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include=
/apr_que
ue.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-=
r0/apr-util-1.5.1/include/apr_reslist.h /OE/shr-core/tmp-eglibc/work/xscale=
te-oe-li
nux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_rmm.h /OE/shr-core=
/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1=
/include
/apr_sdbm.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util=
/1.5.1-r0/apr-util-1.5.1/include/apr_sha1.h /OE/shr-core/tmp-eglibc/work/xs=
calete-o
e-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_strmatch.h /OE=
/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-u=
til-1.5.
1/include/apr_thread_pool.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-=
gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_uri.h /OE/shr-core/tmp=
-eglibc/
work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr=
_uuid.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5=
=2E1-r0/ap
r-util-1.5.1/include/apr_xlate.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-l=
inux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/apr_xml.h /OE/shr-cor=
e/tmp-eg
libc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/includ=
e/apu_errno.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-ut=
il/1.5.1
-r0/apr-util-1.5.1/include/apu_version.h /OE/shr-core/tmp-eglibc/work/xscal=
ete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/private/apr_c=
rypto_in
ternal.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.=
5.1-r0/apr-util-1.5.1/include/private/apr_dbd_internal.h /OE/shr-core/tmp-e=
glibc/wo
rk/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include/priva=
te/apr_dbd_odbc_v2.h /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi=
/apr-uti
l/1.5.1-r0/apr-util-1.5.1/include/private/apr_dbm_private.h /OE/shr-core/tm=
p-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/in=
clude/pr
ivate/apu_internal.h > export_vars.c
| sed 's,^\(location=3D\).*$,\1installed,' < apu-1-config > apu-config.out
| /bin/sh arm-oe-linux-gnueabi-libtool --silent --mode=3Dcompile arm-oe-lin=
ux-gnueabi-gcc  -march=3Darmv5te  -mthumb -mthumb-interwork  -mtune=3Dxscal=
e --sysroot=3D/O
E/shr-core/tmp-eglibc/sysroots/spitz   -O2 -pipe -g -feliminate-unused-debu=
g-types -DHAVE_CONFIG_H -D_REENTRANT -D_GNU_SOURCE   -I/OE/shr-core/tmp-egl=
ibc/work
/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include -I/OE/s=
hr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-uti=
l-1.5.1/
include/private  -I/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -I/O=
E/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -o buckets/apr_brigade.lo=
 -c buck
ets/apr_brigade.c && touch buckets/apr_brigade.lo
| /bin/sh arm-oe-linux-gnueabi-libtool --silent --mode=3Dcompile arm-oe-lin=
ux-gnueabi-gcc  -march=3Darmv5te  -mthumb -mthumb-interwork  -mtune=3Dxscal=
e --sysroot=3D/O
E/shr-core/tmp-eglibc/sysroots/spitz   -O2 -pipe -g -feliminate-unused-debu=
g-types -DHAVE_CONFIG_H -D_REENTRANT -D_GNU_SOURCE   -I/OE/shr-core/tmp-egl=
ibc/work
/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include -I/OE/s=
hr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-uti=
l-1.5.1/
include/private  -I/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -I/O=
E/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -o buckets/apr_buckets.lo=
 -c buck
ets/apr_buckets.c && touch buckets/apr_buckets.lo
| /bin/sh arm-oe-linux-gnueabi-libtool --silent --mode=3Dcompile arm-oe-lin=
ux-gnueabi-gcc  -march=3Darmv5te  -mthumb -mthumb-interwork  -mtune=3Dxscal=
e --sysroot=3D/O
E/shr-core/tmp-eglibc/sysroots/spitz   -O2 -pipe -g -feliminate-unused-debu=
g-types -DHAVE_CONFIG_H -D_REENTRANT -D_GNU_SOURCE   -I/OE/shr-core/tmp-egl=
ibc/work
/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include -I/OE/s=
hr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-uti=
l-1.5.1/
include/private  -I/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -I/O=
E/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -o buckets/apr_buckets_al=
loc.lo -
c buckets/apr_buckets_alloc.c && touch buckets/apr_buckets_alloc.lo
| /bin/sh arm-oe-linux-gnueabi-libtool --silent --mode=3Dcompile arm-oe-lin=
ux-gnueabi-gcc  -march=3Darmv5te  -mthumb -mthumb-interwork  -mtune=3Dxscal=
e --sysroot=3D/O
E/shr-core/tmp-eglibc/sysroots/spitz   -O2 -pipe -g -feliminate-unused-debu=
g-types -DHAVE_CONFIG_H -D_REENTRANT -D_GNU_SOURCE   -I/OE/shr-core/tmp-egl=
ibc/work
/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include -I/OE/s=
hr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-uti=
l-1.5.1/
include/private  -I/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -I/O=
E/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -o buckets/apr_buckets_eo=
s.lo -c
buckets/apr_buckets_eos.c && touch buckets/apr_buckets_eos.lo
| /bin/sh arm-oe-linux-gnueabi-libtool --silent --mode=3Dcompile arm-oe-lin=
ux-gnueabi-gcc  -march=3Darmv5te  -mthumb -mthumb-interwork  -mtune=3Dxscal=
e --sysroot=3D/O
E/shr-core/tmp-eglibc/sysroots/spitz   -O2 -pipe -g -feliminate-unused-debu=
g-types -DHAVE_CONFIG_H -D_REENTRANT -D_GNU_SOURCE   -I/OE/shr-core/tmp-egl=
ibc/work
/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include -I/OE/s=
hr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-uti=
l-1.5.1/
include/private  -I/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -I/O=
E/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -o buckets/apr_buckets_fi=
le.lo -c
 buckets/apr_buckets_file.c && touch buckets/apr_buckets_file.lo
| /bin/sh arm-oe-linux-gnueabi-libtool --silent --mode=3Dcompile arm-oe-lin=
ux-gnueabi-gcc  -march=3Darmv5te  -mthumb -mthumb-interwork  -mtune=3Dxscal=
e --sysroot=3D/O
E/shr-core/tmp-eglibc/sysroots/spitz   -O2 -pipe -g -feliminate-unused-debu=
g-types -DHAVE_CONFIG_H -D_REENTRANT -D_GNU_SOURCE   -I/OE/shr-core/tmp-egl=
ibc/work
/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include -I/OE/s=
hr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-uti=
l-1.5.1/
include/private  -I/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -I/O=
E/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -o buckets/apr_buckets_fl=
ush.lo -
c buckets/apr_buckets_flush.c && touch buckets/apr_buckets_flush.lo
| /bin/sh arm-oe-linux-gnueabi-libtool --silent --mode=3Dcompile arm-oe-lin=
ux-gnueabi-gcc  -march=3Darmv5te  -mthumb -mthumb-interwork  -mtune=3Dxscal=
e --sysroot=3D/O
E/shr-core/tmp-eglibc/sysroots/spitz   -O2 -pipe -g -feliminate-unused-debu=
g-types -DHAVE_CONFIG_H -D_REENTRANT -D_GNU_SOURCE   -I/OE/shr-core/tmp-egl=
ibc/work
/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include -I/OE/s=
hr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-uti=
l-1.5.1/
include/private  -I/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -I/O=
E/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -o buckets/apr_buckets_he=
ap.lo -c
 buckets/apr_buckets_heap.c && touch buckets/apr_buckets_heap.lo
| /bin/sh arm-oe-linux-gnueabi-libtool --silent --mode=3Dcompile arm-oe-lin=
ux-gnueabi-gcc  -march=3Darmv5te  -mthumb -mthumb-interwork  -mtune=3Dxscal=
e --sysroot=3D/O
E/shr-core/tmp-eglibc/sysroots/spitz   -O2 -pipe -g -feliminate-unused-debu=
g-types -DHAVE_CONFIG_H -D_REENTRANT -D_GNU_SOURCE   -I/OE/shr-core/tmp-egl=
ibc/work
/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1/include -I/OE/s=
hr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-uti=
l-1.5.1/
include/private  -I/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -I/O=
E/shr-core/tmp-eglibc/sysroots/spitz/usr/include  -o buckets/apr_buckets_mm=
ap.lo -c
 buckets/apr_buckets_mmap.c && touch buckets/apr_buckets_mmap.lo
| /bin/sh arm-oe-linux-gnueabi-libtool --silent --mode=3Dcompile arm-oe-lin=
ux-gnueabi-gcc  -march=3Darmv5te  -mthumb -mthumb-interwork  -mtune=3Dxscal=
e --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/spitz   -O2 -pipe -g -felimi=
nate-unused-debug-types -DHAVE_CONFIG_H -D_REENTRANT -D_GNU_SOURCE   -I/OE/=
shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/apr-util/1.5.1-r0/apr-ut=
il-1.5.1/include -I/OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/a=
pr-util/1.5.1-r0/apr-util-1.5.1/include/private  -I/OE/shr-core/tmp-eglibc/=
sysroots/spitz/usr/include  -I/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/in=
clude  -o buckets/apr_buckets_pipe.lo -c buckets/apr_buckets_pipe.c && touc=
h buckets/apr_buckets_pipe.lo
| arm-oe-linux-gnueabi-libtool: compile: unable to infer tagged configurati=
on
| arm-oe-linux-gnueabi-libtool: compile: specify a tag with `--tag'
| make[1]: *** [buckets/apr_buckets.lo] Error 1
| make[1]: *** Waiting for unfinished jobs....
| arm-oe-linux-gnueabi-libtool: compile: unable to infer tagged configurati=
on
| arm-oe-linux-gnueabi-libtool: compile: specify a tag with `--tag'
| make[1]: *** [buckets/apr_buckets_eos.lo] Error 1
| arm-oe-linux-gnueabi-libtool: compile: unable to infer tagged configurati=
on
| arm-oe-linux-gnueabi-libtool: compile: specify a tag with `--tag'
| make[1]: *** [buckets/apr_buckets_alloc.lo] Error 1
| arm-oe-linux-gnueabi-libtool: compile: unable to infer tagged configurati=
on
| arm-oe-linux-gnueabi-libtool: compile: specify a tag with `--tag'
| make[1]: *** [buckets/apr_buckets_heap.lo] Error 1
| arm-oe-linux-gnueabi-libtool: compile: unable to infer tagged configurati=
on
| arm-oe-linux-gnueabi-libtool: compile: specify a tag with `--tag'
| make[1]: *** [buckets/apr_buckets_file.lo] Error 1
| arm-oe-linux-gnueabi-libtool: compile: unable to infer tagged configurati=
on
| arm-oe-linux-gnueabi-libtool: compile: unable to infer tagged configurati=
on
| arm-oe-linux-gnueabi-libtool: compile: specify a tag with `--tag'
| arm-oe-linux-gnueabi-libtool: compile: specify a tag with `--tag'
| make[1]: *** [buckets/apr_buckets_mmap.lo] Error 1
| make[1]: *** [buckets/apr_buckets_flush.lo] Error 1
| arm-oe-linux-gnueabi-libtool: compile: unable to infer tagged configurati=
on
| arm-oe-linux-gnueabi-libtool: compile: specify a tag with `--tag'
| make[1]: *** [buckets/apr_brigade.lo] Error 1
| arm-oe-linux-gnueabi-libtool: compile: unable to infer tagged configurati=
on
| arm-oe-linux-gnueabi-libtool: compile: specify a tag with `--tag'
| make[1]: *** [buckets/apr_buckets_pipe.lo] Error 1
| make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/xscalete-oe-linu=
x-gnueabi/apr-util/1.5.1-r0/apr-util-1.5.1'
| make: *** [all-recursive] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /OE/shr-core/tmp-eglibc/work/xsca=
lete-oe-linux-gnueabi/apr-util/1.5.1-r0/temp/log.do_compile.14537 for furth=
er infor
mation)
NOTE: recipe apr-util-1.5.1-r0: task do_compile: Failed
ERROR: Task 6557 (/OE/shr-core/openembedded-core/meta/recipes-support/apr/a=
pr-util_1.5.1.bb, do_compile) failed with exit code '1'


>=20
> ---
>=20
>  .../apr/{apr-util_1.4.1.bb =3D> apr-util_1.5.1.bb}   |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-support/apr/apr-util_1.4.1.bb b/meta/recipes-su=
pport/apr/apr-util_1.5.1.bb
> similarity index 91%
> rename from meta/recipes-support/apr/apr-util_1.4.1.bb
> rename to meta/recipes-support/apr/apr-util_1.5.1.bb
> index 7ee3de5..e547fe0 100644
> --- a/meta/recipes-support/apr/apr-util_1.4.1.bb
> +++ b/meta/recipes-support/apr/apr-util_1.5.1.bb
> @@ -9,14 +9,14 @@ LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D519e0a18e03f7c023070568c14b07=
7bb \
>                      file://include/apu_version.h;endline=3D17;md5=3D8066=
85a84e71f10c80144c48eb35df42"
> =20
> -PR =3D "r2"
> +PR =3D "r0"
> =20
>  SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
>             file://configfix.patch \
>             file://configure_fixes.patch"
> =20
> -SRC_URI[md5sum] =3D "666a5d56098a9debf998510e304c8095"
> -SRC_URI[sha256sum] =3D "d636d9ef95c6e50e47fc338d532aa375edd11e5d7a3c30de=
e48beb38ddf4ab4c"
> +SRC_URI[md5sum] =3D "490c2e26e2dc95fd0983ad71112ddac6"
> +SRC_URI[sha256sum] =3D "0cf4e48d93ceb9a5e314f48fe127211b71d30234665587e2=
eaffbb4fc13d931d"
> =20
>  EXTRA_OECONF =3D "--with-apr=3D${STAGING_BINDIR_CROSS}/apr-1-config \=20
>  		--without-odbc \
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFImegACgkQN1Ujt2V2gBycHwCgmC2rr4kX34N77fvjB18AiRx1
wdMAoJ/SeNKIRqXQ/C+aP7Fs3o7+6pLv
=F0Sr
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
