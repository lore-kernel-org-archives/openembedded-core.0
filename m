Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3190277086
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 17:41:11 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id h186so30575262pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=OR75TfoZlzgT24rqs5zRFwnt9LpzjC1LaBFXliycz9M=;
	b=FTTck9IZoOyTv6C2dGsqYJMyYJnR6pStzstdFS6b9/zOE9+PrmfcE6/88Zrl8IUxbn
	9KyMgJ8nkN3sHw67AIbFBJJl/nsS86vc2pCiEg66iZ/CG67fvKEJY8AZpmSzwwQqIQYe
	q0ovajERMjak82OKwfggoTDPxoHEYtbYmRPDJk5INCXo58LoRTMFelCdDmB6cZyXb1jv
	ZeEl9/6hjZ88UG3CfYcq85EFtuGHUMF0/wSrxr0cUHpf3cMV+yqRcL7XMjJhszuwwB0f
	utTchGlrHCPWCOaFEUcMAUPJKi9Q7vNi54zeaIzTvVrebs6Ol5+P/QKPxpSo0gXmBJyT
	v0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=OR75TfoZlzgT24rqs5zRFwnt9LpzjC1LaBFXliycz9M=;
	b=joHJJG6llK1W7EoCJwfqNaiemUocdqEK0FIR9PiSeRaJc4Nfw9kAP+g23ec6SGLHe3
	I6bFXhqtmSunxpysQOo6E3WaTk6BZZy8LaG58ylu7Adw01g5xV1jhue2lCr28kj7xyWC
	+7r7gb2y5amiIe/QJEv7busUdQb0/4UIwc4boHdctXK/eCll02bz+0uPmUYIGahc6BcN
	pgDrOTMNdnD6ihcn5KOUG4F5Bfyp1iU9L6FRuFakKqDIAHFSVgQKZ1yEl2OcRfdSrrfz
	WNDw5uVMtf2f8tASbFZAPRRwo4teknOUscv/6YOSbhlgC9lWBYMbT03A3fF3ZOtVo7AS
	BcrA==
X-Gm-Message-State: AE9vXwOgnVpDpAj7FDgGxK9NVx1OdSbjU2MAJltCIhJM6wbNg9hGUmUm47VXzOpvBJWJnQ==
X-Received: by 10.98.86.85 with SMTP id k82mr8171631pfb.82.1472233271877;
	Fri, 26 Aug 2016 10:41:11 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:fd71:b54b:e502:fedc?
	([2601:647:4c00:3edf:fd71:b54b:e502:fedc])
	by smtp.gmail.com with ESMTPSA id
	zk7sm30273626pac.41.2016.08.26.10.41.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Aug 2016 10:41:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160826173423.31040-1-raj.khem@gmail.com>
Date: Fri, 26 Aug 2016 10:41:42 -0700
Message-Id: <345E27C8-845E-4AF3-8A6B-2190F572E557@gmail.com>
References: <20160826173423.31040-1-raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH] bash: Fix build with clang+security flags
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
X-List-Received-Date: Fri, 26 Aug 2016 17:41:13 -0000
X-Groupsio-MsgNum: 86386
Content-Type: multipart/signed;
	boundary="Apple-Mail=_75A8399C-873E-469E-8A9E-B205C87D4E7E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_75A8399C-873E-469E-8A9E-B205C87D4E7E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

ignore it

> On Aug 26, 2016, at 10:34 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> ...1-help-fix-printf-format-security-warning.patch | 223 =
++++++++++++++++++++-
> meta/recipes-extended/bash/bash_4.3.30.bb          |   2 +
> 2 files changed, 218 insertions(+), 7 deletions(-)
>=20
> diff --git =
a/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-war=
ning.patch =
b/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-war=
ning.patch
> index 5405c84..516debb 100644
> --- =
a/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-war=
ning.patch
> +++ =
b/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-war=
ning.patch
> @@ -17,10 +17,10 @@ Upstream-Status: Pending
>  builtins/help.def | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> -diff --git a/builtins/help.def b/builtins/help.def
> -index 1894f17..cf624c6 100644
> ---- a/builtins/help.def
> -+++ b/builtins/help.def
> +Index: bash-4.3.30/builtins/help.def
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bash-4.3.30.orig/builtins/help.def
> ++++ bash-4.3.30/builtins/help.def
> @@ -127,7 +127,7 @@ help_builtin (list)
>=20
>    if (glob_pattern_p (list->word->word))
> @@ -30,6 +30,215 @@ index 1894f17..cf624c6 100644
>        print_word_list (list, ", ");
>        printf ("'\n\n");
>      }
> ---
> -2.8.1
> -
> +Index: bash-4.3.30/shell.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bash-4.3.30.orig/shell.c
> ++++ bash-4.3.30/shell.c
> +@@ -1864,7 +1864,7 @@ show_shell_usage (fp, extra)
> +     {
> +       fprintf (fp, _("Type `%s -c \"help set\"' for more information =
about shell options.\n"), shell_name);
> +       fprintf (fp, _("Type `%s -c help' for more information about =
shell builtin commands.\n"), shell_name);
> +-      fprintf (fp, _("Use the `bashbug' command to report =
bugs.\n"));
> ++      fprintf (fp, "%s", _("Use the `bashbug' command to report =
bugs.\n"));
> +     }
> + }
> +
> +Index: bash-4.3.30/error.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bash-4.3.30.orig/error.c
> ++++ bash-4.3.30/error.c
> +@@ -170,7 +170,7 @@ programming_error (format, va_alist)
> +   fprintf (stderr, "Report this to %s\n", the_current_maintainer);
> + #endif
> +
> +-  fprintf (stderr, _("Aborting..."));
> ++  fprintf (stderr, "%s", _("Aborting..."));
> +   fflush (stderr);
> +
> +   abort ();
> +@@ -262,12 +262,12 @@ internal_warning (format, va_alist)
> +   va_list args;
> +
> +   error_prolog (1);
> +-  fprintf (stderr, _("warning: "));
> ++  fprintf (stderr, "%s", _("warning: "));
> +
> +   SH_VA_START (args, format);
> +
> +   vfprintf (stderr, format, args);
> +-  fprintf (stderr, "\n");
> ++  fprintf (stderr, "%s", "\n");
> +
> +   va_end (args);
> + }
> +Index: bash-4.3.30/eval.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bash-4.3.30.orig/eval.c
> ++++ bash-4.3.30/eval.c
> +@@ -186,7 +186,7 @@ static sighandler
> + alrm_catcher(i)
> +      int i;
> + {
> +-  printf (_("\007timed out waiting for input: auto-logout\n"));
> ++  printf ("%s", _("\007timed out waiting for input: =
auto-logout\n"));
> +   fflush (stdout);
> +   bash_logout ();	/* run ~/.bash_logout if this is a login shell =
*/
> +   jump_to_top_level (EXITPROG);
> +Index: bash-4.3.30/execute_cmd.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bash-4.3.30.orig/execute_cmd.c
> ++++ bash-4.3.30/execute_cmd.c
> +@@ -2284,7 +2284,7 @@ execute_pipeline (command, asynchronous,
> +       /* Make a pipeline between the two commands. */
> +       if (pipe (fildes) < 0)
> + 	{
> +-	  sys_error (_("pipe error"));
> ++	  sys_error ("%s", _("pipe error"));
> + #if defined (JOB_CONTROL)
> + 	  terminate_current_pipeline ();
> + 	  kill_current_pipeline ();
> +Index: bash-4.3.30/make_cmd.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bash-4.3.30.orig/make_cmd.c
> ++++ bash-4.3.30/make_cmd.c
> +@@ -320,9 +320,9 @@ make_arith_for_command (exprs, action, l
> +   if (nsemi !=3D 3)
> +     {
> +       if (nsemi < 3)
> +-	parser_error (lineno, _("syntax error: arithmetic expression =
required"));
> ++	parser_error (lineno, "%s", _("syntax error: arithmetic =
expression required"));
> +       else
> +-	parser_error (lineno, _("syntax error: `;' unexpected"));
> ++	parser_error (lineno, "%s", _("syntax error: `;' unexpected"));
> +       parser_error (lineno, _("syntax error: `((%s))'"), =
exprs->word->word);
> +       free (init);
> +       free (test);
> +Index: bash-4.3.30/parse.y
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bash-4.3.30.orig/parse.y
> ++++ bash-4.3.30/parse.y
> +@@ -4204,7 +4204,7 @@ cond_error ()
> +   char *etext;
> +
> +   if (EOF_Reached && cond_token !=3D COND_ERROR)		/* [[ */
> +-    parser_error (cond_lineno, _("unexpected EOF while looking for =
`]]'"));
> ++    parser_error (cond_lineno, "%s", _("unexpected EOF while looking =
for `]]'"));
> +   else if (cond_token !=3D COND_ERROR)
> +     {
> +       if (etext =3D error_token_from_token (cond_token))
> +@@ -4213,7 +4213,7 @@ cond_error ()
> + 	  free (etext);
> + 	}
> +       else
> +-	parser_error (cond_lineno, _("syntax error in conditional =
expression"));
> ++	parser_error (cond_lineno, "%s", _("syntax error in conditional =
expression"));
> +     }
> + }
> +
> +@@ -4295,7 +4295,7 @@ cond_term ()
> + 	      free (etext);
> + 	    }
> + 	  else
> +-	    parser_error (lineno, _("expected `)'"));
> ++	    parser_error (lineno, "%s",  _("expected `)'"));
> + 	  COND_RETURN_ERROR ();
> + 	}
> +       term =3D make_cond_node (COND_EXPR, (WORD_DESC *)NULL, term, =
(COND_COM *)NULL);
> +@@ -4327,7 +4327,7 @@ cond_term ()
> + 	      free (etext);
> + 	    }
> + 	  else
> +-	    parser_error (line_number, _("unexpected argument to =
conditional unary operator"));
> ++	    parser_error (line_number, "%s", _("unexpected argument to =
conditional unary operator"));
> + 	  COND_RETURN_ERROR ();
> + 	}
> +
> +@@ -4377,7 +4377,7 @@ cond_term ()
> + 	      free (etext);
> + 	    }
> + 	  else
> +-	    parser_error (line_number, _("conditional binary operator =
expected"));
> ++	    parser_error (line_number, "%s", _("conditional binary =
operator expected"));
> + 	  dispose_cond_node (tleft);
> + 	  COND_RETURN_ERROR ();
> + 	}
> +@@ -4403,7 +4403,7 @@ cond_term ()
> + 	      free (etext);
> + 	    }
> + 	  else
> +-	    parser_error (line_number, _("unexpected argument to =
conditional binary operator"));
> ++	    parser_error (line_number, "%s", _("unexpected argument to =
conditional binary operator"));
> + 	  dispose_cond_node (tleft);
> + 	  dispose_word (op);
> + 	  COND_RETURN_ERROR ();
> +@@ -6023,7 +6023,7 @@ parse_compound_assignment (retlenp)
> + 	{
> + 	  current_token =3D tok;	/* for error reporting */
> + 	  if (tok =3D=3D yacc_EOF)	/* ( */
> +-	    parser_error (orig_line_number, _("unexpected EOF while =
looking for matching `)'"));
> ++	    parser_error (orig_line_number, "%s", _("unexpected EOF =
while looking for matching `)'"));
> + 	  else
> + 	    yyerror(NULL);	/* does the right thing */
> + 	  if (wl)
> +Index: bash-4.3.30/print_cmd.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bash-4.3.30.orig/print_cmd.c
> ++++ bash-4.3.30/print_cmd.c
> +@@ -375,7 +375,7 @@ xtrace_set (fd, fp)
> +     }
> +   if (fp =3D=3D 0)
> +     {
> +-      internal_error (_("xtrace_set: NULL file pointer"));
> ++      internal_error ("%s", _("xtrace_set: NULL file pointer"));
> +       return;
> +     }
> +   if (fd >=3D 0 && fileno (fp) !=3D fd)
> +Index: bash-4.3.30/variables.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bash-4.3.30.orig/variables.c
> ++++ bash-4.3.30/variables.c
> +@@ -2237,7 +2237,7 @@ make_local_variable (name)
> +
> +   if (vc =3D=3D 0)
> +     {
> +-      internal_error (_("make_local_variable: no function context at =
current scope"));
> ++      internal_error ("%s", _("make_local_variable: no function =
context at current scope"));
> +       return ((SHELL_VAR *)NULL);
> +     }
> +   else if (vc->table =3D=3D 0)
> +@@ -3685,7 +3685,7 @@ all_local_variables ()
> +
> +   if (vc =3D=3D 0)
> +     {
> +-      internal_error (_("all_local_variables: no function context at =
current scope"));
> ++      internal_error ("%s", _("all_local_variables: no function =
context at current scope"));
> +       return (SHELL_VAR **)NULL;
> +     }
> +   if (vc->table =3D=3D 0 || HASH_ENTRIES (vc->table) =3D=3D 0 || =
vc_haslocals (vc) =3D=3D 0)
> +@@ -4404,7 +4404,7 @@ pop_var_context ()
> +   vcxt =3D shell_variables;
> +   if (vc_isfuncenv (vcxt) =3D=3D 0)
> +     {
> +-      internal_error (_("pop_var_context: head of shell_variables =
not a function context"));
> ++      internal_error ("%s", _("pop_var_context: head of =
shell_variables not a function context"));
> +       return;
> +     }
> +
> +@@ -4417,7 +4417,7 @@ pop_var_context ()
> +       dispose_var_context (vcxt);
> +     }
> +   else
> +-    internal_error (_("pop_var_context: no global_variables =
context"));
> ++    internal_error ("%s", _("pop_var_context: no global_variables =
context"));
> + }
> +
> + /* Delete the HASH_TABLEs for all variable contexts beginning at =
VCXT, and
> +@@ -4491,7 +4491,7 @@ pop_scope (is_special)
> +   vcxt =3D shell_variables;
> +   if (vc_istempscope (vcxt) =3D=3D 0)
> +     {
> +-      internal_error (_("pop_scope: head of shell_variables not a =
temporary environment scope"));
> ++      internal_error ("%s", _("pop_scope: head of shell_variables =
not a temporary environment scope"));
> +       return;
> +     }
> +
> diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb =
b/meta/recipes-extended/bash/bash_4.3.30.bb
> index 765562f..4a1b181 100644
> --- a/meta/recipes-extended/bash/bash_4.3.30.bb
> +++ b/meta/recipes-extended/bash/bash_4.3.30.bb
> @@ -69,3 +69,5 @@ SRC_URI[patch046.md5sum] =3D =
"7e5fb09991c077076b86e0e057798913"
> SRC_URI[patch046.sha256sum] =3D =
"b3b456a6b690cd293353f17e22d92a202b3c8bce587ae5f2667c20c9ab6f688f"
>=20
> BBCLASSEXTEND =3D "nativesdk"
> +
> +TOOLCHAIN =3D "gcc"
> --
> 2.9.3
>=20


--Apple-Mail=_75A8399C-873E-469E-8A9E-B205C87D4E7E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfAf1oACgkQuwUzVZGdMxQHrwCbB7THV/yUWxhaRSJtRUVCn5xJ
8UoAmgP8whzwlLuHsWX07gQdciXDsSZb
=HH6D
-----END PGP SIGNATURE-----

--Apple-Mail=_75A8399C-873E-469E-8A9E-B205C87D4E7E--
