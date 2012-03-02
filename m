Received: from smtp1.4emm.com ([69.18.222.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S3NkX-0001pv-Mm
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 09:22:01 +0100
Received: from HUB20.4emm.local (192.168.160.61) by HUB01.4emm.local
	(192.168.160.132) with Microsoft SMTP Server (TLS) id 8.2.255.0;
	Fri, 2 Mar 2012 03:12:27 -0500
Received: from MBX21.4emm.local ([fe80::a0d4:cb04:3e3c:8690]) by
	HUB20.4emm.local ([fe80::25a0:1c69:da2b:f9cc%14]) with mapi id
	14.01.0289.001; Fri, 2 Mar 2012 03:12:27 -0500
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gdk-pixbuf: Pick up ${NM}	from	the environment.
Thread-Index: AQHM+EnqMvHyRRMz806ZZqq3dc67pJZWpE/w
Date: Fri, 2 Mar 2012 08:12:26 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF3380020C@MBX21.4emm.local>
References: <1330414619-21016-1-git-send-email-james@digitalmatter.com.au>
	<4F4F4A20.9060406@gmail.com>
	<840A81C1B782724A8EB52725BD519EFF33800103@MBX21.4emm.local>
	<20120302052348.GA15160@sakrah.homelinux.org>
	<840A81C1B782724A8EB52725BD519EFF338001B6@MBX21.4emm.local>
	<20120302075537.GA1850@sakrah.homelinux.org>
In-Reply-To: <20120302075537.GA1850@sakrah.homelinux.org>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [PATCH] gdk-pixbuf: Pick up ${NM}	from	the	environment.
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
X-List-Received-Date: Fri, 02 Mar 2012 08:22:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Khem Raj
> Sent: Friday, 2 March 2012 3:56 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] gdk-pixbuf: Pick up ${NM} from the
> environment.
>=20
> > It is more than set in the environment - the configure script spits out=
 two
> messages about it before hitting this macro.
> > So, I think the check is entirely extraneous.
> >
>=20
> if you can point that there is another check which makes this one
> redundant thats a different issue and then your patch is ok. but I doubt
> thats the case
>=20
> > I have seen this issue patched out in other gnome packages, some in oe-
> core.
> > At least one was marked Upstream-Status: Inappropriate [configuration],
> and one marked Pending.
> > So I got the idea that upstream was not interested...
>=20
> usually such patches are taken status may be too conservative
>=20

Here is the fragment from the configure script, with the patch applied. Sor=
ry, it's quite long:

{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for BSD- or MS-compatible=
 name lister (nm)" >&5
$as_echo_n "checking for BSD- or MS-compatible name lister (nm)... " >&6; }
if ${lt_cv_path_NM+:} false; then :
  $as_echo_n "(cached) " >&6
else
  if test -n "$NM"; then
  # Let the user override the test.
  lt_cv_path_NM=3D"$NM"
else
  lt_nm_to_check=3D"${ac_tool_prefix}nm"
  if test -n "$ac_tool_prefix" && test "$build" =3D "$host"; then
    lt_nm_to_check=3D"$lt_nm_to_check nm"
  fi
  for lt_tmp_nm in $lt_nm_to_check; do
    lt_save_ifs=3D"$IFS"; IFS=3D$PATH_SEPARATOR
    for ac_dir in $PATH /usr/ccs/bin/elf /usr/ccs/bin /usr/ucb /bin; do
      IFS=3D"$lt_save_ifs"
      test -z "$ac_dir" && ac_dir=3D.
      tmp_nm=3D"$ac_dir/$lt_tmp_nm"
      if test -f "$tmp_nm" || test -f "$tmp_nm$ac_exeext" ; then
	# Check to see if the nm accepts a BSD-compat flag.
	# Adding the `sed 1q' prevents false positives on HP-UX, which says:
	#   nm: unknown option "B" ignored
	# Tru64's nm complains that /dev/null is an invalid object file
	case `"$tmp_nm" -B /dev/null 2>&1 | sed '1q'` in
	*/dev/null* | *'Invalid file or object type'*)
	  lt_cv_path_NM=3D"$tmp_nm -B"
	  break
	  ;;
	*)
	  case `"$tmp_nm" -p /dev/null 2>&1 | sed '1q'` in
	  */dev/null*)
	    lt_cv_path_NM=3D"$tmp_nm -p"
	    break
	    ;;
	  *)
	    lt_cv_path_NM=3D${lt_cv_path_NM=3D"$tmp_nm"} # keep the first match, b=
ut
	    continue # so that we can try to find one that supports BSD flags
	    ;;
	  esac
	  ;;
	esac
      fi
    done
    IFS=3D"$lt_save_ifs"
  done
  : ${lt_cv_path_NM=3Dno}
fi
fi
{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_NM" >&5
$as_echo "$lt_cv_path_NM" >&6; }
if test "$lt_cv_path_NM" !=3D "no"; then
  NM=3D"$lt_cv_path_NM"
else
  # Didn't find any BSD compatible name lister, look for dumpbin.
  if test -n "$DUMPBIN"; then :
    # Let the user override the test.
  else
    if test -n "$ac_tool_prefix"; then
  for ac_prog in dumpbin "link -dump"
  do
    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a p=
rogram name with args.
set dummy $ac_tool_prefix$ac_prog; ac_word=3D$2
{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
$as_echo_n "checking for $ac_word... " >&6; }
if ${ac_cv_prog_DUMPBIN+:} false; then :
  $as_echo_n "(cached) " >&6
else
  if test -n "$DUMPBIN"; then
  ac_cv_prog_DUMPBIN=3D"$DUMPBIN" # Let the user override the test.
else
as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
for as_dir in $PATH
do
  IFS=3D$as_save_IFS
  test -z "$as_dir" && as_dir=3D.
    for ac_exec_ext in '' $ac_executable_extensions; do
  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_wo=
rd$ac_exec_ext"; }; then
    ac_cv_prog_DUMPBIN=3D"$ac_tool_prefix$ac_prog"
    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_e=
xt" >&5
    break 2
  fi
done
  done
IFS=3D$as_save_IFS


I believe this code is generated by libtool, in ./m4/libtool.m4.
I have _no_ idea how libtool works, or fits in with autotools, so I'm not t=
oo sure whether AC_CHECK_TOOLS makes sense here or not.
I'm happy to resubmit and/or file a bugzilla report with Gnome.

Regards,
James



