Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S4jS7-00038v-K2
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 02:44:36 +0100
Received: by pbbrp12 with SMTP id rp12so4502670pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 17:35:59 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.237.201 as permitted sender) client-ip=10.68.237.201; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.237.201 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.237.201])
	by 10.68.237.201 with SMTP id ve9mr39418496pbc.45.1330997759568
	(num_hops = 1); Mon, 05 Mar 2012 17:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VmgtaFub+UMRJNBA6nGbFH3sJ13IewplBBuejVacK8c=;
	b=KPZ/mq+OhfgKviPoab8RcUOz2Hm+hG8KvLdQTV76UGO93IBqm1y9vAlx1xs7dgdDKM
	Aad/He5JbVex2BdhksRjJ++3QM6nAtEM27/RH14Dz3osyorLWTp3egIAJlqiOKnyGXlb
	TBevPzhehXSdnR6IRRjgJeXa63yM8ro6ftkZVk507rr22Vrh6DtSJRKq2x28AOKuGZsR
	LibADgfKMS7VPtur8zsqTwxMKUSzUmmHcUQKKt8V4NhnszAawGrluZ+ajYDOIOYU6O9c
	MeDhocUjigmpbV0eufE1fTDUgIvhEs5BW+KFFjmeFsr4ZIncB2C681LbZyA9LVCjxCH9
	olkw==
Received: by 10.68.237.201 with SMTP id ve9mr34040978pbc.45.1330997759491;
	Mon, 05 Mar 2012 17:35:59 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id f9sm14771517pbq.60.2012.03.05.17.35.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 17:35:58 -0800 (PST)
Date: Mon, 5 Mar 2012 17:37:53 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120306013753.GB6841@sakrah.homelinux.org>
References: <1330414619-21016-1-git-send-email-james@digitalmatter.com.au>
	<4F4F4A20.9060406@gmail.com>
	<840A81C1B782724A8EB52725BD519EFF33800103@MBX21.4emm.local>
	<20120302052348.GA15160@sakrah.homelinux.org>
	<840A81C1B782724A8EB52725BD519EFF338001B6@MBX21.4emm.local>
	<20120302075537.GA1850@sakrah.homelinux.org>
	<840A81C1B782724A8EB52725BD519EFF3380020C@MBX21.4emm.local>
MIME-Version: 1.0
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF3380020C@MBX21.4emm.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Tue, 06 Mar 2012 01:44:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/03/12 08:12), James Limbouris wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Khem Raj
> > Sent: Friday, 2 March 2012 3:56 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH] gdk-pixbuf: Pick up ${NM} from the
> > environment.
> > 
> > > It is more than set in the environment - the configure script spits out two
> > messages about it before hitting this macro.
> > > So, I think the check is entirely extraneous.
> > >
> > 
> > if you can point that there is another check which makes this one
> > redundant thats a different issue and then your patch is ok. but I doubt
> > thats the case
> > 
> > > I have seen this issue patched out in other gnome packages, some in oe-
> > core.
> > > At least one was marked Upstream-Status: Inappropriate [configuration],
> > and one marked Pending.
> > > So I got the idea that upstream was not interested...
> > 
> > usually such patches are taken status may be too conservative
> > 
> 
> Here is the fragment from the configure script, with the patch applied. Sorry, it's quite long:
> 
> { $as_echo "$as_me:${as_lineno-$LINENO}: checking for BSD- or MS-compatible name lister (nm)" >&5
> $as_echo_n "checking for BSD- or MS-compatible name lister (nm)... " >&6; }
> if ${lt_cv_path_NM+:} false; then :
>   $as_echo_n "(cached) " >&6
> else
>   if test -n "$NM"; then
>   # Let the user override the test.
>   lt_cv_path_NM="$NM"
> else
>   lt_nm_to_check="${ac_tool_prefix}nm"
>   if test -n "$ac_tool_prefix" && test "$build" = "$host"; then
>     lt_nm_to_check="$lt_nm_to_check nm"
>   fi
>   for lt_tmp_nm in $lt_nm_to_check; do
>     lt_save_ifs="$IFS"; IFS=$PATH_SEPARATOR
>     for ac_dir in $PATH /usr/ccs/bin/elf /usr/ccs/bin /usr/ucb /bin; do
>       IFS="$lt_save_ifs"
>       test -z "$ac_dir" && ac_dir=.
>       tmp_nm="$ac_dir/$lt_tmp_nm"
>       if test -f "$tmp_nm" || test -f "$tmp_nm$ac_exeext" ; then
> 	# Check to see if the nm accepts a BSD-compat flag.
> 	# Adding the `sed 1q' prevents false positives on HP-UX, which says:
> 	#   nm: unknown option "B" ignored
> 	# Tru64's nm complains that /dev/null is an invalid object file
> 	case `"$tmp_nm" -B /dev/null 2>&1 | sed '1q'` in
> 	*/dev/null* | *'Invalid file or object type'*)
> 	  lt_cv_path_NM="$tmp_nm -B"
> 	  break
> 	  ;;
> 	*)
> 	  case `"$tmp_nm" -p /dev/null 2>&1 | sed '1q'` in
> 	  */dev/null*)
> 	    lt_cv_path_NM="$tmp_nm -p"
> 	    break
> 	    ;;
> 	  *)
> 	    lt_cv_path_NM=${lt_cv_path_NM="$tmp_nm"} # keep the first match, but
> 	    continue # so that we can try to find one that supports BSD flags
> 	    ;;
> 	  esac
> 	  ;;
> 	esac
>       fi
>     done
>     IFS="$lt_save_ifs"
>   done
>   : ${lt_cv_path_NM=no}
> fi
> fi
> { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_NM" >&5
> $as_echo "$lt_cv_path_NM" >&6; }
> if test "$lt_cv_path_NM" != "no"; then
>   NM="$lt_cv_path_NM"
> else
>   # Didn't find any BSD compatible name lister, look for dumpbin.
>   if test -n "$DUMPBIN"; then :
>     # Let the user override the test.
>   else
>     if test -n "$ac_tool_prefix"; then
>   for ac_prog in dumpbin "link -dump"
>   do
>     # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
> set dummy $ac_tool_prefix$ac_prog; ac_word=$2
> { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> $as_echo_n "checking for $ac_word... " >&6; }
> if ${ac_cv_prog_DUMPBIN+:} false; then :
>   $as_echo_n "(cached) " >&6
> else
>   if test -n "$DUMPBIN"; then
>   ac_cv_prog_DUMPBIN="$DUMPBIN" # Let the user override the test.
> else
> as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> for as_dir in $PATH
> do
>   IFS=$as_save_IFS
>   test -z "$as_dir" && as_dir=.
>     for ac_exec_ext in '' $ac_executable_extensions; do
>   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
>     ac_cv_prog_DUMPBIN="$ac_tool_prefix$ac_prog"
>     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>     break 2
>   fi
> done
>   done
> IFS=$as_save_IFS
> 
> 
> I believe this code is generated by libtool, in ./m4/libtool.m4.
> I have _no_ idea how libtool works, or fits in with autotools, so I'm not too sure whether AC_CHECK_TOOLS makes sense here or not.
> I'm happy to resubmit and/or file a bugzilla report with Gnome.
> 


Please resubmit



